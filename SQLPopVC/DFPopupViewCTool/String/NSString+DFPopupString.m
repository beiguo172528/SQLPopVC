//
//  NSString+DFPopupString.m
//  DFPopupView
//
//  Created by DOFAR on 2018/10/12.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "NSString+DFPopupString.h"

@implementation NSString (DFPopupString)
-(CGSize)getStringSizeWithRectSize:(CGSize)rectSize andFontSize:(CGFloat)fontSize{
    return  [self boundingRectWithSize:rectSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}
@end
