//
//  UIColor+DFToolColor.h
//  Test
//
//  Created by DOFAR on 2018/10/11.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GradualChangingDirection) {
    GradualChangingDirectionTopToBottom,
    GradualChangingDirectionLeftToRight,
    GradualChangingDirectionBottomToTop,
    GradualChangingDirectionRightToLeft,
};

@interface UIColor (DFToolColor)
//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColorStr:(NSString *)fromHexColorStr toColorStr:(NSString *)toHexColorStr;
//获取16进制颜色的方法
+ (UIColor *)colorWithHex:(NSString *)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view withGradualChangingDirection:(GradualChangingDirection)direction fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

/**
 主色调，导航颜色
 
 @return UIColor
 */
+(UIColor*)mainColor;


/**
 小面积使用，强调文字，按钮颜色
 
 @return UIColor
 */
+(UIColor*)emphasizeColor;


/**
 提醒、警示文字和图标
 
 @return UIColor
 */
+(UIColor*)remindColor;


/**
 辅助色
 
 @return UIColor
 */
+(UIColor*)auxiliaryColor;


/**
 重要文字颜色
 
 @return UIColor
 */
+(UIColor*)importantTextColor;


/**
 正文文字颜色
 
 @return UIColor
 */
+(UIColor*)commonlyTextColor;


/**
 辅助、次要、说明文字颜色
 
 @return UIColor
 */
+(UIColor*)auxiliaryTextColor;


/**
 分割线颜色
 
 @return UIColor
 */
+(UIColor*)segmentingLineColor;


/**
 视图背景颜色
 
 @return UIColor
 */
+(UIColor*)viewBackgroundColor;


/**
 确定
 
 @return UIColor
 */
+(UIColor*)sureColor;


/**
 未结束颜色
 
 @return UIColor
 */
+(UIColor*)noFinishedColor;
@end
