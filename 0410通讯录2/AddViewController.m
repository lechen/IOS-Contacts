//
//  AddViewController.m
//  0410通讯录2
//
//  Created by LE on 15/1/25.
//  Copyright (c) 2015年 LE. All rights reserved.
//

#import "AddViewController.h"
#import "ContactsModel.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveBtnEvent:(UIButton *)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkText) name:nil object:self.accountName];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkText) name:nil object:self.phoneNum];
}

-(void)checkText{
    self.saveBtn.enabled = (self.accountName.text.length && self.phoneNum.text.length);
}

/**
 *  当控制器销毁时清除注册过的通知
 */
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  当前controller显示完成调用
 */
-(void)viewDidAppear:(BOOL)animated{
    [self.accountName becomeFirstResponder];
}

/**
 *  保存按钮
 */
- (IBAction)saveBtnEvent:(UIButton *)sender {
    //销毁当前controller
    [self.navigationController popViewControllerAnimated:YES];
    
    //判断delegate是否实现了addViewController:WithContracts:
    if ([self.delegate respondsToSelector:@selector(addViewController:WithContracts:)]) {
        ContactsModel *contacts = [[ContactsModel alloc] init];
        contacts.name = self.accountName.text;
        contacts.phoneNum = self.phoneNum.text;
        [self.delegate addViewController:self WithContracts:contacts];
    }
}
@end
