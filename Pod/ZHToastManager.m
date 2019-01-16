//
//  ZHToastManager.m
//  Pod
//
//  Created by crazycao on 2017/3/16.
//  Copyright © 2017年 naruto. All rights reserved.
//

#import "ZHToastManager.h"
#import "ZHToastDefine.h"
#import "MBProgressHUD+ZHHelper.h"

@implementation ZHToastManager

#pragma mark - 显示toast

// 快速显示一个提示信息
+ (void)showToast:(NSString *)toastStr
{
    UIView *topView = [[UIApplication sharedApplication].delegate window];
    [self showToast:toastStr toView:topView];
}

+ (void)showToast:(NSString *)toastStr toView:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].delegate window];
    }
    [MBProgressHUD zh_showToastForView:view withMessage:toastStr afterDelay:1.5f];
}

+ (void)showError:(NSString *)error toView:(UIView *)view
{
    [self show:error icon:ZHToastBundleImage(@"mb_error") view:view afterDelay:1.5f];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:ZHToastBundleImage(@"mb_success") view:view afterDelay:1.5f];
}

+ (void)show:(NSString*)text icon:(UIImage *)icon view:(UIView*)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil){
        view = [[UIApplication sharedApplication].delegate window];
    }
    [self.class hideHud:view];
    [MBProgressHUD zh_showToastForView:view withIcon:icon andText:text afterDelay:delay];
}

#pragma mark - 显示提示框

+ (MBProgressHUD *)showHud:(NSString *)message
{
   return [[self class] showHud:message toView:nil];
}

+ (MBProgressHUD *)showHud:(NSString *)message toView:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].delegate window];
    }
    [self.class hideHud:view];
    
    MBProgressHUD *hud = [MBProgressHUD zh_showHUDForView:view  withMessage:message animated:YES];
    
    return hud;
}

#pragma mark - 隐藏提示框

+ (void)hideHud
{
    [[self class] hideHud:nil];
}

+ (void)hideHud:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].delegate window];
    }
    [MBProgressHUD zh_hideHUDForView:view animated:YES];
}

+ (void)hideHud:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.class hideHud:view];
    });
}

#pragma mark - 是否已有提示框

+ (BOOL)isHudAppeared {
    return [self isHudAppearedInView:nil];
}

+ (BOOL)isHudAppearedInView:(UIView *)view {
    if (view == nil){
        view = [[UIApplication sharedApplication].delegate window];
    }
    
    MBProgressHUD *subHudView = [self.class zh_findHudAppearedInView:view isToastView:NO];
    if (subHudView != nil) {
        return YES;
    }
    return NO;
}

@end
