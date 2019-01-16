//
//  ZHToastManager.h
//  Pod
//
//  Created by crazycao on 2017/3/16.
//  Copyright © 2017年 naruto. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wstrict-prototypes"
#import <MBProgressHUD/MBProgressHUD.h>
#pragma clang diagnostic pop

@interface ZHToastManager : NSObject

#pragma mark - 显示toast

/**
 显示 toast 提示 [window 上]，自动隐藏
 
 @param toastStr 消息内容
 @param error 错误消息内容
 @param success 成功消息内容
 @param view 显示在view上，若为nil则显示在window上
 */
+ (void)showToast:(NSString *)toastStr;
+ (void)showToast:(NSString *)toastStr toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;


#pragma mark -  显示提示框 MBProgressHUD

/**
 显示 hud 提示 [window 上]

 @param message 消息内容
 @param view 显示在view上，若为nil则显示在window上
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showHud:(NSString *)message;
+ (MBProgressHUD *)showHud:(NSString *)message toView:(UIView *)view;

#pragma mark - 隐藏提示框 MBProgressHUD

/**
 隐藏 view 上面的提示框
 @param view 显示在view上，若为nil则显示在window上
 @param delay 持续指定时间后隐藏
 */
+ (void)hideHud;
+ (void)hideHud:(UIView *)view;
+ (void)hideHud:(UIView *)view afterDelay:(NSTimeInterval)delay;

#pragma mark - 是否已有提示框 MBProgressHUD

/**
 指定 view 上是否已有提示框
 @param view 显示在view上，若为nil则显示在window上
 */
+ (BOOL)isHudAppeared;
+ (BOOL)isHudAppearedInView:(UIView *)view;
@end
