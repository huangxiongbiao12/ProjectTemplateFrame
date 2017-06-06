//
//  RegisterVC.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()
{
    //倒计时验证码
    NSInteger _time;
    NSTimer *_selectTimer;
}
@property (strong, nonatomic) IBOutlet UITextField *userTF;
@property (strong, nonatomic) IBOutlet UITextField *vertifyTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UIButton *getVertiCodeBtn;
@property (strong, nonatomic) IBOutlet UIButton *sureBtn;
@end

@implementation RegisterVC

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
    _time = 60;
    self.view.backgroundColor = kBackgroundGrayDefautColor;
    self.passwordTF.secureTextEntry = YES;
    
    self.sureBtn.layer.cornerRadius = 3;
    self.sureBtn.enabled = NO;
//    [self.sureBtn setBackgroundImage:[HXBColor imageFromColor:kButtonDisDefautColor] forState:UIControlStateDisabled];
    [self.sureBtn setBackgroundImage:[HXBColor imageFromColor:kNavBarMainColor] forState:UIControlStateNormal];
    
    self.getVertiCodeBtn.enabled = NO;
//    [self.getVertiCodeBtn setBackgroundImage:[HXBColor imageFromColor:kButtonDisDefautColor] forState:UIControlStateDisabled];
//    [self.getVertiCodeBtn setBackgroundImage:[HXBColor imageFromColor:kButtonNomDefautColor] forState:UIControlStateNormal];
    
    [self.passwordTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self.userTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self.vertifyTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    self.vertifyTF.placeColor = [UIColor whiteColor];
    self.userTF.placeColor = [UIColor whiteColor];
    self.passwordTF.placeColor = [UIColor whiteColor];
    _sureBtn.backgroundColor = kNavBarMainColor;
    
    UIButton *userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.frame = CGRectMake(0, 0, 44, 44);
    [userBtn setImage:[UIImage imageNamed:@"icon_login_user"] forState:UIControlStateNormal];
    self.userTF.leftView = userBtn;
    self.userTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *mmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mmBtn.frame = CGRectMake(0, 0, 44, 44);
    [mmBtn setImage:[UIImage imageNamed:@"icon_login_lock"] forState:UIControlStateNormal];
    self.passwordTF.leftView = mmBtn;
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *verBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    verBtn.frame = CGRectMake(0, 0, 44, 44);
    [verBtn setImage:[UIImage imageNamed:@"icon_login_lock"] forState:UIControlStateNormal];
    self.vertifyTF.leftView = verBtn;
    self.vertifyTF.leftViewMode = UITextFieldViewModeAlways;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)registerAction:(id)sender {
    
    if (![NSString validateMobile:self.userTF.text]) {
        [MBProgressHUD showError:@"输入正确的手机号"]; return;
    }
    if (!(self.vertifyTF.text.length > 0)) {
        [MBProgressHUD showError:@"输入正确验证码"]; return;
    }
    if (!(self.passwordTF.text.length >= 6)) {
        [MBProgressHUD showError:@"密码需不小于6位"]; return;
    }
    if (_selectTimer) {
        [_selectTimer invalidate];
        [self.getVertiCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.getVertiCodeBtn.enabled = YES;
    }
    [HttpRequstData postUrl:kUseRegisterUrl parameters:@{@"phone":self.userTF.text,@"verifyCode":self.vertifyTF.text,@"password":self.passwordTF.text} success:^(id responseObject) {
        if (_regsiterSuc) {
            _regsiterSuc(self.userTF.text,self.passwordTF.text);
        }
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark-------
- (IBAction)getVertify:(id)sender {
    
    if (![NSString validateMobile:self.userTF.text]) {
        [MBProgressHUD showError:@"输入正确的手机号"]; return;
    }
    [HttpRequstData postUrl:kGetPhoneVertifyUrl parameters:@{@"phone":self.userTF.text} success:^(id responseObject) {
        DDLog(@"验证码====%@",responseObject);
        _time = 60;
        [sender setTitle:[NSString stringWithFormat:@"倒计时 %ld s",_time] forState:UIControlStateNormal];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(lastTime:) userInfo:nil repeats:YES];
        UIButton *btn = sender;
        btn.enabled = NO;
    } failure:^(NSError *error) {
        
    }];
    
}
-(void)lastTime:(NSTimer*)timer
{
    _selectTimer = timer;
    _time--;
    if (!_time) {
        
        [_getVertiCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [timer invalidate];
        _getVertiCodeBtn.enabled =YES;
        return;
    }
    [_getVertiCodeBtn setTitle:[NSString stringWithFormat:@"倒计时 %ld s",_time] forState:UIControlStateNormal];
    
}

#pragma mark-------
-(void)tfChange:(UITextField*)tf
{
    if (_userTF.text.length&&_passwordTF.text.length&&_vertifyTF.text.length) {
        _sureBtn.enabled = YES;
    }else{
        _sureBtn.enabled = NO;
    }
    if (_time!=60) {
        return;
    }
    if (_userTF.text.length) {
        _getVertiCodeBtn.enabled = YES;
    }else{
        _getVertiCodeBtn.enabled = NO;
    }
}

- (IBAction)eyeAction:(id)sender {
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    self.passwordTF.secureTextEntry = !self.passwordTF.secureTextEntry;
}

@end
