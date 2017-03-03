//
//  SuperViewController.h
//  PHPackAge
//
//  Created by wdx on 16/8/11.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHDefine.h"
#import "PHPackAge-Swift.h"
#import "CellView.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
@interface SuperViewController : UIViewController
@property (nonatomic,strong)UIImageView * naviImg;
/*
 *显示 提示 框
 */
-(void)showAlertWithTitle:(NSString *)title content:(NSString *)content block:(void (^)())block;
-(void)showPromptBoxWithSting:(NSString *)prompt;

///*
// *
// */
//-(void)customView;

@end
