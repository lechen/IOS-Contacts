//
//  LoginViewController.m
//  0410通讯录2
//
//  Created by LE on 15/1/25.
//  Copyright (c) 2015年 LE. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()
/**
 *  账号
 */
@property (weak, nonatomic) IBOutlet UITextField *accountField;
/**
 *  密码
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
/**
 *  记住密码
 */
@property (weak, nonatomic) IBOutlet UISwitch *rememberPwdSwitch;
/**
 *  记住密码事件
 */
- (IBAction)rememberPwdEvent;
/**
 *  自动登录
 */
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
/**
 *  自动登录事件
 */
- (IBAction)autoLoginEvent;
/**
 *  登陆按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
/**
 *  登陆按钮事件
 */
- (IBAction)loginClickEvent;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //监听账号输入框
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    // 监听密码输入框
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}

-(void)dealloc{
    //移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  控制loginBtn的enabled
 */
-(void)textChange{
    self.loginBtn.enabled = (self.accountField.text.length && self.pwdField.text.length);
}
/**
 *  记住密码
 */
- (IBAction)rememberPwdEvent {
    if (!self.rememberPwdSwitch.isOn) {
        self.autoLoginSwitch.on = NO;
    }
}
/**
 *  自动登录
 */
- (IBAction)autoLoginEvent {
    if (self.autoLoginSwitch.isOn) {
        self.rememberPwdSwitch.on = YES;
    }
}
/**
 *  登陆
 */
- (IBAction)loginClickEvent {
    if ([self.accountField.text isEqualToString:@"tom"] && [self.pwdField.text isEqualToString:@"111"]) {
        //正在登陆提示
        [MBProgressHUD showMessage:@"正在登陆..."];
        //等待2s
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //移除遮盖
            [MBProgressHUD hideHUD];
            //跳转
            [self performSegueWithIdentifier:@"login2list" sender:nil];
        });
    }else{
        [MBProgressHUD showError:@"账号或密码错误！"];
    }
}
@end
