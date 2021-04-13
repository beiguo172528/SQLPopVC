//
//  DFPopViewTextField.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/13.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopViewTextField.h"
#import "UIColor+DFToolColor.h"
#import "DFPopupController.h"

@implementation DFPopViewTextField
-(void)changeUI{
    self.font = [UIFont systemFontOfSize:17];
    self.textAlignment = NSTextAlignmentCenter;
    self.borderStyle = UITextBorderStyleNone;
    
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, self.frame.size.width, 0.5)];
    line.backgroundColor = CKDarkMode?[UIColor colorWithRed:0x1e/255.0f green:0x1e/255.0f blue:0x1e/255.0f alpha:1.0f]:[UIColor whiteColor];
    [self addSubview:line];
    
}

@end
