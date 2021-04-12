//
//  UIColor+DFToolColor.m
//  Test
//
//  Created by DOFAR on 2018/10/11.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "UIColor+DFToolColor.h"

@implementation UIColor (DFToolColor)
//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColorStr:(NSString *)fromHexColorStr toColorStr:(NSString *)toHexColorStr{
    
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHex:toHexColorStr].CGColor];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view withGradualChangingDirection:(GradualChangingDirection)direction fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHex:toHexColorStr].CGColor];
    switch (direction) {
        case GradualChangingDirectionTopToBottom:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 1);
            break;
        case GradualChangingDirectionBottomToTop:
            gradientLayer.startPoint = CGPointMake(1, 1);
            gradientLayer.endPoint = CGPointMake(0, 0);
            break;
        case GradualChangingDirectionLeftToRight:
            gradientLayer.startPoint = CGPointMake(0, 1);
            gradientLayer.endPoint = CGPointMake(1, 1);
            break;
        case GradualChangingDirectionRightToLeft:
            gradientLayer.startPoint = CGPointMake(1, 1);
            gradientLayer.endPoint = CGPointMake(0, 1);
            break;
        default:
            break;
    }
   
    
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}

//获取16进制颜色的方法
+ (UIColor *)colorWithHex:(NSString *)hexColor {
    hexColor = [hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([hexColor length] < 6) {
        return nil;
    }
    if ([hexColor hasPrefix:@"#"]) {
        hexColor = [hexColor substringFromIndex:1];
    }
    NSRange range;
    range.length = 2;
    range.location = 0;
    NSString *rs = [hexColor substringWithRange:range];
    range.location = 2;
    NSString *gs = [hexColor substringWithRange:range];
    range.location = 4;
    NSString *bs = [hexColor substringWithRange:range];
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rs] scanHexInt:&r];
    [[NSScanner scannerWithString:gs] scanHexInt:&g];
    [[NSScanner scannerWithString:bs] scanHexInt:&b];
    if ([hexColor length] == 8) {
        range.location = 4;
        NSString *as = [hexColor substringWithRange:range];
        [[NSScanner scannerWithString:as] scanHexInt:&a];
    } else {
        a = 255;
    }
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:((float)a / 255.0f)];
}

// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+(UIColor*)mainColor{
    return [UIColor colorWithHex:@"00a2ff"];
}

+(UIColor*)emphasizeColor{
    return [UIColor colorWithHex:@"ff9000"];
}

+(UIColor*)remindColor{
    return [UIColor colorWithHex:@"e44d5c"];
}

+(UIColor*)auxiliaryColor{
    return [UIColor colorWithHex:@"77c4fa"];
}

+(UIColor*)importantTextColor{
    return [UIColor colorWithHex:@"111111"];
}

+(UIColor*)commonlyTextColor{
    return [UIColor colorWithHex:@"444444"];
}

+(UIColor*)auxiliaryTextColor{
    return [UIColor colorWithHex:@"777777"];
}

+(UIColor*)segmentingLineColor{
    return [UIColor colorWithHex:@"dddddd"];
}

+(UIColor*)viewBackgroundColor{
    return [UIColor colorWithHex:@"eeeeee"];
}

+(UIColor*)sureColor{
    return [UIColor colorWithHex:@"00b215"];
}

+(UIColor*)noFinishedColor{
    return [UIColor colorWithHex:@"18d7c7"];
}
@end
