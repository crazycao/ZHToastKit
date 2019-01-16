//
//  MBProgressHUD+ZHHelper.m
//  Pods
//
//  Created by crazycao on 2017/3/28.
//
//

#import "MBProgressHUD+ZHHelper.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (ZHHelper)

#pragma mark - zhToast

-(BOOL)zhToast
{
    return [objc_getAssociatedObject(self, @selector(zhToast)) boolValue];
}

-(void)setZhToast:(BOOL)zhToast
{
    objc_setAssociatedObject(self, @selector(zhToast), @(zhToast), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - view 上的 hud view(非toast view)

+ (MBProgressHUD *)zh_showHUDForView:(UIView *)view withMessage:(NSString *)message animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4f];
    hud.bezelView.layer.cornerRadius = 12.f;
    hud.contentColor = [UIColor whiteColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = message;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (BOOL)zh_hideHUDForView:(UIView *)view animated:(BOOL)animated
{
    __block MBProgressHUD *subHudView = [self.class zh_findHudAppearedInView:view isToastView:NO];
    
    if (subHudView != nil) {
        subHudView.removeFromSuperViewOnHide = YES;
        [subHudView hideAnimated:animated];
        return YES;
    }
    return NO;
}



#pragma mark - view 上的 toast view

+ (MBProgressHUD *)zh_showToastForView:(UIView *)view withMessage:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.mode = MBProgressHUDModeText;
    hud.zhToast = YES;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.bezelView.layer.cornerRadius = 3;
    hud.animationType = MBProgressHUDAnimationZoomIn;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.detailsLabel.text = message;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}

+ (MBProgressHUD *)zh_showToastForView:(UIView *)view withIcon:(UIImage *)icon andText:(NSString *)text afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.zhToast = YES;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:icon];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}

+ (BOOL)zh_hideToastForView:(UIView *)view animated:(BOOL)animated
{
    __block MBProgressHUD *subToastView = [self.class zh_findHudAppearedInView:view isToastView:YES];
    
    if (subToastView != nil) {
        subToastView.removeFromSuperViewOnHide = YES;
        [subToastView hideAnimated:animated];
        return YES;
    }
    return NO;
}

#pragma mark - 找到 view 上的 hud view  或 toast view

+ (MBProgressHUD *)zh_findHudAppearedInView:(UIView *)view isToastView:(BOOL)isToastView
{
    __block MBProgressHUD *subHudView = nil;
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            MBProgressHUD *subHudViewTmp = (MBProgressHUD *)obj;
            if(subHudViewTmp.zhToast == isToastView){
                subHudView = subHudViewTmp;
                *stop = YES;
            }
        }
    }];
    return subHudView;
}


@end
