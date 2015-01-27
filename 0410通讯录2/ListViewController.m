//
//  ListViewController.m
//  0410通讯录2
//
//  Created by LE on 15/1/25.
//  Copyright (c) 2015年 LE. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()<UIActionSheetDelegate>
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

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (IBAction)logoutEvent:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定注销吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    return;
}

- (IBAction)addBtnEvent:(id)sender {
}
@end
