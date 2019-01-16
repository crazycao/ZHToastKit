//
//  MBProgressHUD+ZHHelper.h
//  Pods
//
//  Created by crazycao on 2017/3/28.
//
//  MBProgressHUD category

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wstrict-prototypes"
#import <MBProgressHUD/MBProgressHUD.h>
#pragma clang diagnostic pop

@interface MBProgressHUD (ZHHelper)

/**
 是否是toast
 */
@property (nonatomic, assign) BOOL                              zhToast;


#pragma mark - view 上的 hud view

/**
 在 view 上显示 hud view
 
 @param view 父view
 @param message 提示信息
 @param animated 动画参数
 @return MBProgressHUD hud对象
 */
+ (MBProgressHUD *)zh_showHUDForView:(UIView *)view withMessage:(NSString *)message animated:(BOOL)animated;

/**
 隐藏 view 上的hud view

 @param view 父view
 @param animated 动画参数
 @return BOOL
 */
+ (BOOL)zh_hideHUDForView:(UIView *)view animated:(BOOL)animated;


#pragma mark - view 上的 toast view

/**
 在 view 上显示 toast view
 
 @param view 父view
 @param icon toast上显示的icon
 @param text 提示信息
 @param delay toast持续时长
 @return MBProgressHUD
 */
+ (MBProgressHUD *)zh_showToastForView:(UIView *)view withIcon:(UIImage *)icon andText:(NSString *)text afterDelay:(NSTimeInterval)delay;

/**
 在 view 上显示 toast view
 
 @param view 父view
 @param message 提示信息
 @param delay toast持续时长
 @return MBProgressHUD
 */
+ (MBProgressHUD *)zh_showToastForView:(UIView *)view withMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

/**
 隐藏 view 上的 toast view
 
 @param view 父view
 @param animated 动画参数
 @return BOOL
 */
+ (BOOL)zh_hideToastForView:(UIView *)view animated:(BOOL)animated;

#pragma mark - 找到 view 上的 hud view 或 toast view

/**
 找到 view 上的 hud view 或 toast view
 
 @param view 父view
 @param isToastView 是否要找toast
 @return MBProgressHUD
 */
+ (MBProgressHUD *)zh_findHudAppearedInView:(UIView *)view isToastView:(BOOL)isToastView;

@end
