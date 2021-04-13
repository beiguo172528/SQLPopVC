![image](https://github.com/beiguo172528/SQLPopVC/blob/main/images/GIF.gif)
使用方法：
1.pod 'SQLPopVC'
2.根据需求选择创建使用方式：

+(DFPopupController*_Nullable)popupViewAddToViewController:(UIViewController*_Nullable)viewController style:(DFPopupControllerStyle)stype Message:(NSString*_Nullable)message;

+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message inputTextF:(textFieldHandler _Nullable )textFieldHandler okButton:(buttonHandler _Nullable )okButtonHandler cancleButton:(buttonHandler _Nullable )cancleButtonHandler;

+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message okButton:(buttonHandler _Nullable )okButtonHandler cancleButton:(buttonHandler _Nullable )cancleButtonHandler;


+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title message:(NSString*_Nullable)message okButton:(buttonHandler _Nullable )okButtonHandler;


+(DFPopupController*_Nullable)popupViewWithTitle:(NSString*_Nullable)title imgName:(NSString*_Nullable)imgName message:(NSString*_Nullable)message;

然后调用[self presentViewController:vc animated:YES completion:nil];

另外可以添加输入框（可以添加多个）
-(void)addPopViewTextFieldWithConfigurationHandler:(textFieldHandler _Nullable )textFieldHandler;

 添加其它控件（可以是自己的图片，webview等）
-(void)addPopOtherView:(UIView*_Nullable)otherView;

 添加popViewButton
-(void)addPopViewButton:(DFPopViewButton*_Nullable)popViewButton;

 添加多个popViewButtons
-(void)addPopViewButtons:(NSArray*_Nullable)popViewButtons;

修改图片大小
-(void)setImageViewWidth:(CGFloat)width withHeight:(CGFloat)height;


注意：
1.显示的弹框在window上（windowLevel = 1000），可以放心使用
2.DFPopupController 的 DFPopupControllerStyle 有几种选择：
typedef NS_ENUM(NSInteger,DFPopupControllerStyle) {
    DFPopupControllerStyleDefaule,//默认，没有图片
    DFPopupControllerStyleSure,   //确认
    DFPopupControllerStyleDanger, //危险
    DFPopupControllerStyleError,  //错误
};
3.DFPopupController 的转场风格：
    【1】.presentStyle
    【2】.dismissStyle
    可以自己选择


GitHub：https://github.com/beiguo172528/SQLPopVC
简书：https://www.jianshu.com/p/2d524038a093
