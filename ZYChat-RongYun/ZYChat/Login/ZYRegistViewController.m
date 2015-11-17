//
//  ZYRegistViewController.m
//  ZYChat
//
//  Created by ZYVincent on 15/11/9.
//  Copyright (c) 2015年 ZYProSoft. All rights reserved.
//

#import "ZYRegistViewController.h"
#import "ZYFriendServiceManager.h"

@interface ZYRegistViewController ()

@property (nonatomic,strong)UITextField *mobileTextField;

@property (nonatomic,strong)UITextField *passwordTextField;

@property (nonatomic,strong)UIButton *loginButton;

@property (nonatomic,strong)ZYFriendServiceManager *serviceManager;

@end

@implementation ZYRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setStrNavTitle:@"注册"];
    
    self.mobileTextField = [[UITextField alloc]init];
    self.mobileTextField.gjcf_width = GJCFSystemScreenWidth - 2*20.f;
    self.mobileTextField.gjcf_height = 40.f;
    self.mobileTextField.gjcf_top = 60.f;
    self.mobileTextField.placeholder = @"请输入手机号";;
    self.mobileTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.mobileTextField];
    self.mobileTextField.gjcf_centerX = GJCFSystemScreenWidth/2;
    
    self.passwordTextField = [[UITextField alloc]init];
    self.passwordTextField.gjcf_width = GJCFSystemScreenWidth - 2*20.f;
    self.passwordTextField.gjcf_height = 40.f;
    self.passwordTextField.gjcf_top = self.mobileTextField.gjcf_bottom + 20.f;
    self.passwordTextField.placeholder = @"请输入密码";;
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.gjcf_centerX = GJCFSystemScreenWidth/2;
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.gjcf_width = self.mobileTextField.gjcf_width;
    self.loginButton.gjcf_height = self.mobileTextField.gjcf_height;
    self.loginButton.gjcf_centerX = self.mobileTextField.gjcf_centerX;
    self.loginButton.gjcf_top = self.passwordTextField.gjcf_bottom + 20.f;
    [self.loginButton setBackgroundImage:GJCFQuickImageByColorWithSize([UIColor orangeColor], self.loginButton.gjcf_size) forState:UIControlStateNormal];
    self.loginButton.layer.cornerRadius = 6.f;
    self.loginButton.layer.masksToBounds = YES;
    [self.view addSubview:self.loginButton];
    [self.loginButton setTitle:@"提    交" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(registAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.serviceManager = [[ZYFriendServiceManager alloc]init];
}

- (void)registAction
{
    ZYUserModel *aUser = [[ZYUserModel alloc]init];
    aUser.mobile = self.mobileTextField.text;
    
   [self.serviceManager registUser:aUser withSuccess:^(ZYUserModel *resultUser) {
       
       
   } withFaild:^(NSError *error) {
       
   }];
}

@end