//
//  BGNetworking.m
//  ProjectFrame
//
//  Created by 黄雄彪 on 16/1/15.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGNetworking.h"
#import "AFAppDotNetAPIClient.h"
#import "MBProgressHUD+MJ.h"
#import "UIView+BG_Tool.h"
#import "DefineHeader.h"
#import "SecurityConf.h"
#import "BGTokenManager.h"
#import "RSAEncryptor.h"
#import "RandomKeyManager.h"
#import "EncryChecker.h"

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO
/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"public"

typedef NS_ENUM(NSInteger,HttpType) {
    GET,
    POST
};

static int timeOut = 30;
static NSString *TOKNE_HEADER = @"t_o_k_e_n";
static NSString *AES_RANDOM_KEY = @"RandomAESKey";

@interface BGNetworking ()
{
    NSString *_url;
    NSDictionary *_parameters;
   
}
@property(nonatomic,strong)UILabel *tipsLable;

@end

@implementation BGNetworking

#pragma mark-------封装请求

+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parametersOrg showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure {
    [[BGNetStatusChecker shareNetStatus] checkNetStatus];
    AFHTTPSessionManager *manager = [AFAppDotNetAPIClient sharedClient];
    manager.requestSerializer.timeoutInterval = timeOut;
    [[BGTokenManager shareTokenManager] getToken:^{
        //将token封装入请求头
        if ([BGSaveTool objectForKey:kToken])
            [manager.requestSerializer setValue:[BGSaveTool objectForKey:kToken] forHTTPHeaderField:TOKNE_HEADER];
        //  获取随机码，将随机码rsa加密后放在请求头中
        NSString *random = [RSAEncryptor encryptString:[RandomKeyManager shareRandomKey].getRandomKey publicKey:RSA_PUBLIC_KEY];
         [manager.requestSerializer setValue:random forHTTPHeaderField:AES_RANDOM_KEY];
        //  处理需要加密的url，将参数进行加密处理
        NSDictionary *parameters = [EncryChecker encryUrl:url param:parametersOrg];
        // 加上这行代码，https ssl 验证。
        if(openHttpsSSL)
            [manager setSecurityPolicy:[self customSecurityPolicy]];
        if (show)
            [MBProgressHUD showMessage:@"加载中..."];
        DDLog(@"parameters:%@==url:%@==%@",parameters,url,parametersOrg);
        [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DDLog(@"====%@,%@==url:%@===parameters:%@",responseObject,responseObject[@"data"],url,parameters);
            if (show)
                [MBProgressHUD hideHUD];
            //登陆成功===================================
            if ([responseObject[@"status"] isEqualToNumber:@500]) {
                if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                    if ([responseObject[@"data"] count] < 1) {
                        //                    [MBProgressHUD showSuccess:@"没有更多数据"];
                    }else{
                        if (show) {
                            //                        [MBProgressHUD showSuccess:@"加载成功"];
                        }
                    }
                }else{
                    if (show) {
                        //                    [MBProgressHUD showSuccess:@"加载成功"];
                    }
                }
                if (success) {
                    success(responseObject);
                }
            }else{//登陆失败=============================
                if ([responseObject[@"data"] isKindOfClass:[NSString class]]) {
                    [MBProgressHUD showError:responseObject[@"data"]];
                }else{
                    [MBProgressHUD showError:@"信息错误"];
                }
                NSError *error1;
                failure(error1);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //         [[NetWorkingStausTipLabel shareNetWorkingStausTipLabel] showDuration:2.0];
            if (show) {
                [MBProgressHUD hideHUD];
            }
            //        [MBProgressHUD showError:@"请求失败"];
            DDLog(@"%s==error--%@",__func__,error);
            if (error) {
                failure(error);
            }
        }];
    }];
}

+(void)postNoTokenUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure {
    [[BGNetStatusChecker shareNetStatus] checkNetStatus];
    AFHTTPSessionManager *manager = [AFAppDotNetAPIClient sharedClient];
;
    manager.requestSerializer.timeoutInterval = timeOut;
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    if (show) {
        [MBProgressHUD showMessage:@"加载中..."];
    }
    DDLog(@"parameters:%@==url:%@==",parameters,url);
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DDLog(@"====%@,%@==url:%@===parameters:%@",responseObject,responseObject[@"data"],url,parameters);
        if (show) {
            [MBProgressHUD hideHUD];
        }
        //登陆成功===================================
        if ([responseObject[@"status"] isEqualToNumber:@500]) {
            if ([responseObject[@"data"] isKindOfClass:[NSArray class]]) {
                if ([responseObject[@"data"] count] < 1) {
                    //                    [MBProgressHUD showSuccess:@"没有更多数据"];
                }else{
                    if (show) {
                        //                        [MBProgressHUD showSuccess:@"加载成功"];
                    }
                }
            }else{
                if (show) {
                    //                    [MBProgressHUD showSuccess:@"加载成功"];
                }
            }
            if (success) {
                success(responseObject);
            }
        }else{//登陆失败=============================
            if ([responseObject[@"data"] isKindOfClass:[NSString class]]) {
                //                if (show) {
                [MBProgressHUD showError:responseObject[@"data"]];
                //                }
            }else{
                //                if (show) {
                [MBProgressHUD showError:@"信息错误"];
                //                }
            }
            NSError *error1;
            failure(error1);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //         [[NetWorkingStausTipLabel shareNetWorkingStausTipLabel] showDuration:2.0];
        if (show) {
            [MBProgressHUD hideHUD];
        }
        //        [MBProgressHUD showError:@"请求失败"];
        DDLog(@"%s==error--%@",__func__,error);
        if (error) {
            failure(error);
        }
    }];
}


+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure
{
    [self postUrl:url parameters:parameters showHUD:YES success:success failure:failure];
}

+(void)postNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure
{
    [self postUrl:url parameters:parameters showHUD:NO success:success failure:failure];
}

#pragma mark-------get

+(void)getUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure
{
    [[BGNetStatusChecker shareNetStatus] checkNetStatus];
    AFHTTPSessionManager *manager = [AFAppDotNetAPIClient sharedClient];
    ;
    manager.requestSerializer.timeoutInterval = timeOut;
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    [MBProgressHUD showMessage:@"加载中..."];
    DDLog(@"parameters:%@",parameters);
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DDLog(@"====%@,%@==url:%@",responseObject,parameters,url);
        [MBProgressHUD hideHUD];
        //登陆成功===================================
        if ([responseObject[@"status"] isEqualToNumber:@500]) {
            [MBProgressHUD showSuccess:@"加载成功"];
            if (success) {
                success(responseObject);
            }
        }else{//登陆失败=============================
            if ([responseObject[@"data"] isKindOfClass:[NSString class]]) {
                [MBProgressHUD showError:responseObject[@"data"]];
            }else{
                [MBProgressHUD showError:@"信息错误"];
            }
            NSError *error1;
            failure(error1);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //         [[NetWorkingStausTipLabel shareNetWorkingStausTipLabel] showDuration:2.0];
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络异常"];
        DDLog(@"%s==error--%@",__func__,error);
        if (error) {
            failure(error);
        }
        
    }];
}

+(void)getNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure {
    [[BGNetStatusChecker shareNetStatus] checkNetStatus];
    AFHTTPSessionManager *manager = [AFAppDotNetAPIClient sharedClient];
    ;
    manager.requestSerializer.timeoutInterval = timeOut;
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    DDLog(@"parameters:%@",parameters);
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DDLog(@"====%@,%@==url:%@",responseObject,parameters,url);
        [MBProgressHUD hideHUD];
        //登陆成功===================================
        if ([responseObject[@"status"] isEqualToNumber:@500]) {
            if (success) {
                success(responseObject);
            }
        }else{//登陆失败=============================
            if ([responseObject[@"data"] isKindOfClass:[NSString class]]) {
                [MBProgressHUD showError:responseObject[@"data"]];
            }else{
                [MBProgressHUD showError:@"信息错误"];
            }
            NSError *error1;
            failure(error1);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //         [[NetWorkingStausTipLabel shareNetWorkingStausTipLabel] showDuration:2.0];
        DDLog(@"%s==error--%@",__func__,error);
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络异常"];
        if (error) {
            failure(error);
        }
        
    }];
}

#pragma mark-------上传图片

+(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block progress:(void (^)(NSProgress *))uploadProgress success:(void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFAppDotNetAPIClient sharedClient];
;
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    return [manager POST:URLString parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:failure];
}

+(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:block progress:nil success:success failure:failure];
}

#pragma mark========https

+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    AFSSLPinningModeNone、AFSSLPinningModeCertificate
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:certData,nil];
    return securityPolicy;
}


#pragma mark=======检测网络状态


+(void)networkStatus{
    AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
    __weak AFNetworkReachabilityManager *weakManager = manager;
    [manager startMonitoring];
    //检测网络状态有网络，网络请求数据，没网络提示
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (!status) {//未连接
            UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
            UILabel *tipsLable;
            if (!tipsLable) {
                tipsLable = [[UILabel alloc] initWithFrame:(CGRect){kScreenWidth/2,kScreenHeight/2+80,kScreenWidth/4,33}];
                tipsLable.textColor = [UIColor whiteColor];
                tipsLable.textAlignment = NSTextAlignmentCenter;
                tipsLable.centerX = window.centerX;
                tipsLable.backgroundColor = [UIColor blackColor];
                tipsLable.text = @"网络未连接";
            }
            [window addSubview:tipsLable];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [tipsLable removeFromSuperview];
            });
            
            return;
        }else{//连接请求数据
            //            [self requstData:type];
        }
        [weakManager stopMonitoring];
    }];
    
}

-(void)networkStatus:(HttpType)type{
    //连接请求数据
//     [self requstData:type];
    AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
    __weak AFNetworkReachabilityManager *weakManager = manager;
    [manager startMonitoring];
    //检测网络状态有网络，网络请求数据，没网络提示
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (!status) {//未连接
            self.tipsLable.text = @"网络未连接";
//            [self.loadingView stopAnimationWithLoadText:@"网络未连接" withType:NO];
            return;
        }else{//连接请求数据
//            [self requstData:type];
        }
        [weakManager stopMonitoring];
    }];
    
}

-(UILabel *)tipsLable{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    if (!_tipsLable) {
        _tipsLable = [[UILabel alloc] initWithFrame:(CGRect){kScreenWidth/2,kScreenHeight/2,kScreenWidth/4,33}];
        _tipsLable.textColor = [UIColor whiteColor];
        _tipsLable.textAlignment = NSTextAlignmentCenter;
        _tipsLable.centerX = window.centerX;
        _tipsLable.backgroundColor = [UIColor blackColor];
    }
    [window addSubview:_tipsLable];
    [self performSelector:@selector(hideTips) withObject:nil  afterDelay:3];
    return _tipsLable;
}

-(void)hideTips{
    
    [_tipsLable removeFromSuperview];
    
}

@end
