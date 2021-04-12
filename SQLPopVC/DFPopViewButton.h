//
//  DFPopViewButton.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/13.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DFPopViewButtonStyle){
    DFPopViewButtonStyleDefault,
    DFPopViewButtonStyleCancle,
};

@protocol DFPopViewButtonDelegate<NSObject>
-(void)addBtnOutAnimation;
@end

@interface DFPopViewButton : UIButton
@property(nonatomic,weak) id<DFPopViewButtonDelegate> delegate;

typedef void (^ ButtonBlock)(DFPopViewButton *popViewButton);


/**
 创建button

 @param title 标题
 @param buttonStyle 类型可选，1.默认类型；2.取消类型
 @param handler block
 @return DFPopViewButton
 */
+(DFPopViewButton*)popViewButtonWithTitle:(NSString*)title style:(DFPopViewButtonStyle)buttonStyle handler:(ButtonBlock)handler;


/**
 修改UI
 */
-(void)changeUI;


@end
