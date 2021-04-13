//
//  DFPopupViewArea.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/12.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFPopViewTextField.h"
#import "DFPopViewButton.h"

@interface DFPopupViewArea : UIView
@property (nonatomic, strong) UIView *otherView;
/**
 设置参数

 @param title 标题
 @param imgName 图片名
 @param message 消息
 */
-(void)setTitle:(NSString*)title imgName:(NSString*)imgName message:(NSString*)message;


/**
 添加DFPopViewTextField到控件中

 @param popViewTextF DFPopViewTextField
 */
-(void)addPopViewTextField:(DFPopViewTextField*)popViewTextF;


/**
 添加otherView到控件中
 
 @param otherView otherView description
 */
-(void)addPopOtherView:(UIView*)otherView;


/**
 添加button到控件中

 @param popViewButton DFPopViewButton description
 */
-(void)addPopViewButton:(DFPopViewButton*)popViewButton;

/**
 得到整个area的高度

 @return 高度
 */
-(CGFloat)getAreaHeight;

-(void)setImageViewWidth:(CGFloat)width withHeight:(CGFloat)height;

@end
