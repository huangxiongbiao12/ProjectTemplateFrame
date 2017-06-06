//
//  LoginVC.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "LoginVC.h"
#import "ForgetVC.h"
#import "RegisterVC.h"
#import "UserModel.h"
#import "AppDelegate.h"

@interface LoginVC ()
{
    BOOL _isVertifyLogin;
}
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UITextField *phoneTF;
@property (strong, nonatomic) IBOutlet UITextField *passWordTF;
@property (strong, nonatomic) IBOutlet UIButton *vertifyBtn;
@property (strong, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation LoginVC

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"icon_fh" highImage:@"icon_fh"];
    
    
    self.loginButton.layer.cornerRadius = 3;
    self.loginButton.enabled = NO;
//    [self.loginButton setBackgroundImage:[HXBColor imageFromColor:kButtonDisDefautColor] forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:[HXBColor imageFromColor:kNavBarMainColor] forState:UIControlStateNormal];
    
    [self.passWordTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *eyeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    eyeBtn.frame = CGRectMake(0, 0, 44, 44);
    [eyeBtn setImage:[UIImage imageNamed:@"icon_mm_yc"] forState:UIControlStateNormal];
    [eyeBtn setImage:[UIImage imageNamed:@"icon_mm_xs"] forState:UIControlStateSelected];
    [eyeBtn addTarget:self action:@selector(eyeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.passWordTF.rightView = eyeBtn;
    self.passWordTF.rightViewMode = UITextFieldViewModeAlways;
    self.passWordTF.secureTextEntry = YES;
    self.passWordTF.placeColor = [UIColor whiteColor];
    
    UIButton *userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.frame = CGRectMake(0, 0, 44, 44);
    [userBtn setImage:[UIImage imageNamed:@"icon_login_user"] forState:UIControlStateNormal];
    self.phoneTF.leftView = userBtn;
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneTF.placeColor = [UIColor whiteColor];

    UIButton *pasBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pasBtn.frame = CGRectMake(0, 0, 44, 44);
    [pasBtn setImage:[UIImage imageNamed:@"icon_login_lock"] forState:UIControlStateNormal];
    self.passWordTF.leftView = pasBtn;
    self.passWordTF.leftViewMode = UITextFieldViewModeAlways;

    self.registerBtn.layer.borderWidth = 1;
    self.registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerBtn.layer.cornerRadius = 5;
    _isVertifyLogin = NO;
    _vertifyBtn.hidden = YES;
    _loginButton.backgroundColor = kNavBarMainColor;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark-------

-(void)tfChange:(UITextField*)tf
{
    if (_phoneTF.text.length&&_passWordTF.text.length) {
        _loginButton.enabled = YES;
    }else{
        _loginButton.enabled = NO;
    }
}

#pragma mark-------navigationItemAction

- (IBAction)loginTypeAction:(id)sender {
    _vertifyBtn.hidden = _isVertifyLogin;
    _isVertifyLogin = !_isVertifyLogin;
}

- (IBAction)loginAcion:(id)sender {
    if (![NSString validateMobile:self.phoneTF.text]) { [MBProgressHUD showError:@"请输入正确的手机号码"]; return; }
    if (self.passWordTF.text.length < 6) { [MBProgressHUD showError:@"密码不能少于6位"]; return; }
    
    [HttpRequstData postUrl:kLoginCommonUrl parameters:@{@"phone":self.phoneTF.text,@"password":self.passWordTF.text} success:^(id responseObject) {
        UserModel *user = [UserModel new];
        [user setValuesForKeysWithDictionary:responseObject[@"data"]];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
        [HXBSaveTool setObject:user.usrid forKey:kUserID];
        [HXBSaveTool setObject:data forKey:kUser];
        [HXBSaveTool setValue:@"klofon" forKey:kLogin];
        //        登陆时上传token
        AppDelegate *appdelegate = kAppDelegate;
        [HttpRequstData postNoHUDUrl:kSetDeviceTokenUrl parameters:@{@"userid":[HXBSaveTool objectForKey:kUserID],@"device_token":appdelegate.token?appdelegate.token:@"",@"ispush":@"1"} success:^(id responseObject) {
            
        } failure:^(NSError *error) {
            
        }];

        //发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLogin object:user];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)eyeBtnAction:(UIButton*)btn
{
    btn.selected = !btn.selected;
    self.passWordTF.secureTextEntry = !self.passWordTF.secureTextEntry;
}

-(IBAction)registerAction:(UIButton*)btn
{
    RegisterVC *vc = [RegisterVC new];
    vc.regsiterSuc = ^(NSString *user,NSString *pw) {
        _phoneTF.text = user;
        _passWordTF.text = pw;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)forgretButton:(UIButton *)sender {
    ForgetVC *vc = [ForgetVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
