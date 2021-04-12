//
//  DFPopupController.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFPopViewButton.h"
#import "DFPopViewTextField.h"
#import "DFPopupViewArea.h"
#import "DFPopupHeader.h"

#define MAXINPUTTEXTFIELDNUMBER 3
#define MAXPOPVIEWBUTTON        3
#define CKDarkMode ({BOOL isDark; if(@available(iOS 13.0, *)) {isDark = UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;} else {isDark = NO;}isDark;})
/** 灰色背景透明度 */
static const CGFloat as_backgroundAlpha = 0.4;

typedef NS_ENUM(NSInteger,DFPopupControllerStyle) {
    DFPopupControllerStyleDefaule,//默认，没有图片
    DFPopupControllerStyleSure,   //确认
    DFPopupControllerStyleDanger, //危险
    DFPopupControllerStyleError,  //错误
};

typedef void (^textFieldHandler) (DFPopViewTextField* _Nullable popViewTextField);
typedef void (^buttonHandler) (DFPopViewButton* _Nullable popViewButton);

@interface DFPopupController : UIViewController

@property(nonatomic,strong)DFPopupViewArea* _Nullable    areaView;
/** 半透明背景 */
@property (nonnull, nonatomic, strong)UIView *backgroundView;


@property(nonatomic,strong)NSMutableArray* _Nullable inputTextFields;
@property(nonatomic,strong)NSMutableArray* _Nullable buttons;

/** present 转场风格 */
@property (nonatomic, assign)DFPopupPresentStyle presentStyle;

/** dismiss 转场风格 */
@property (nonatomic, assign)DFPopupDismissStyle dismissStyle;

@property (nonatomic, assign) BOOL onClickNotDidsmiss;

/**
 工厂方式创建并显示
 
 @param viewController 显示的图上
 @param stype DFPopupViewStyle description
 @return DFPopupView
 */
+(DFPopupController*_Nullable)popupViewAddToViewController:(UIViewController*_Nullable)viewController style:(DFPopupControllerStyle)stype Message:(NSString*_Nullable)message;

/**
 DFPopupViewstyle 带textfield，okbutton，canclebutton创建
 
 @param title 标题
 @param message 信息
 @param textFieldHandler textFieldHandler description
 @param okButtonHandler okButtonHandler description
 @param cancleButtonHandler cancleButtonHandler description
 @return DFPopupView
 */
+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message inputTextF:(textFieldHandler _Nullable )textFieldHandler okButton:(buttonHandler _Nullable )okButtonHandler cancleButton:(buttonHandler _Nullable )cancleButtonHandler;


/**
 DFPopupViewstyle 带okbutton，canclebutton创建
 
 @param title 标题
 @param message 信息
 @param okButtonHandler okButtonHandler description
 @param cancleButtonHandler cancleButtonHandler description
 @return DFPopupView
 */
+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message okButton:(buttonHandler _Nullable )okButtonHandler cancleButton:(buttonHandler _Nullable )cancleButtonHandler;


/**
 DFPopupViewstyle  带okbutton创建
 
 @param title 标题
 @param message 信息
 @param okButtonHandler okButtonHandler description
 @return DFPopupView
 */
+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message okButton:(buttonHandler _Nullable )okButtonHandler;

/**
 创建DFPopupController
 
 @param title 标题
 @param imgName 图片名字，nil的话不显示
 @param message message，可以为空
 @return DFPopupView
 */
+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title imgName:(NSString*_Nullable)imgName message:(NSString*_Nullable)message;



/**
 添加输入框
 
 @param textFieldHandler textFieldHandler description
 */
-(void)addPopViewTextFieldWithConfigurationHandler:(textFieldHandler _Nullable )textFieldHandler;


- (void)showPop;
/**
 添加otherView到控件中
 
 @param otherView otherView description
 */
-(void)addPopOtherView:(UIView*_Nullable)otherView;

/**
 添加popViewButton
 
 @param popViewButton DFPopViewButton
 */
-(void)addPopViewButton:(DFPopViewButton*_Nullable)popViewButton;


/**
 添加popViewButtons

 @param popViewButtons 包含DFPopViewButton的数组
 */
-(void)addPopViewButtons:(NSArray*_Nullable)popViewButtons;
-(void)setImageViewWidth:(CGFloat)width withHeight:(CGFloat)height;
@end
