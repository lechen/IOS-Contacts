//
//  ListViewController.m
//  0410通讯录2
//
//  Created by LE on 15/1/25.
//  Copyright (c) 2015年 LE. All rights reserved.
//

#import "ListViewController.h"
#import "AddViewController.h"
#import "ContactsModel.h"

@interface ListViewController ()<UIActionSheetDelegate,AddViewControllerDelegate>
@property(nonatomic,strong) NSMutableArray *contactsArray;

/**
 *  注销
 */
- (IBAction)logoutEvent:(id)sender;
/**
 *  “+”按钮
 */
- (IBAction)addBtnEvent:(id)sender;

@end

@implementation ListViewController

//当前controller加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置下个页面的返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
}

-(NSMutableArray *)contactsArray{
    if (_contactsArray == nil) {
        _contactsArray = [NSMutableArray array];
    }
    return _contactsArray;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"contacts";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    ContactsModel *contacts = self.contactsArray[indexPath.row];
    cell.textLabel.text = contacts.name;
    cell.detailTextLabel.text = contacts.phoneNum;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

/**
 *  跳转前要调用该方法
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddViewController *ac = segue.destinationViewController;
    ac.delegate = self;
}

/**
 *  实现addViewController的代理方法，完成数据加载
 */
-(void)addViewController:(AddViewController *)addViewController WithContracts:(ContactsModel *)Contacts{
    [self.contactsArray addObject:Contacts];
    [self.tableView reloadData];
}

/**
 *  注销
 */
- (IBAction)logoutEvent:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定注销吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

/**
 *  实现UIActionSheetDelegate的方法，弹窗
 */
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    return;
}

- (IBAction)addBtnEvent:(id)sender {
    [self  performSegueWithIdentifier:@"list2add" sender:nil];
}
@end
