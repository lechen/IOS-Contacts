//
//  AddViewController.h
//  0410通讯录2
//
//  Created by LE on 15/1/25.
//  Copyright (c) 2015年 LE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddViewController;
@class ContactsModel;

@protocol AddViewControllerDelegate <NSObject>

@optional
-(void)addViewController:(AddViewController *)addViewController WithContracts:(ContactsModel *)Contacts;

@end

@interface AddViewController : UIViewController
@property (nonatomic,weak) id<AddViewControllerDelegate> delegate;
@end
