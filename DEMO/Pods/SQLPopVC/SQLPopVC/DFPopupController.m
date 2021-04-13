//
//  DFPopupController.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopupController.h"
#import "DFPopupViewArea.h"
#import "UIColor+DFToolColor.h"
#import "DFPopupPresentAnimator.h"
#import "DFPopupDismissAnimator.h"
#import "NSBundle+DFBundle.h"

@interface DFPopupController ()<UIViewControllerTransitioningDelegate,DFPopViewButtonDelegate>{
    NSString*   _title;
    NSString*   _message;
    NSString*   _imgName;
    UIWindow*   _win;
}
@end

@implementation DFPopupController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        // 灰色半透明背景
        _backgroundView = [[UIView alloc] initWithFrame:self.view.frame];
        _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = as_backgroundAlpha;
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addBtnOutAnimation)];
//        [self.view addGestureRecognizer:tap];
        self.presentStyle = DFPopupPresentStyleSlideDown;
        self.dismissStyle = DFPopupDismissStyleSlideDown;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_backgroundView];
    [self loadAreaXib];
//    [self show];
}

-(void)show{
    _areaView.frame = CGRectMake(0, 0, _areaView.frame.size.width, [_areaView getAreaHeight]);
    _areaView.center = CGPointMake(self.view.center.x, self.view.center.y-40);
    if (self.inputTextFields.count > 0) {
        [self.inputTextFields.firstObject becomeFirstResponder];
    }
    [self.view addSubview:_areaView];
//    [self showWindow];
}

- (void)showPop{
    [self showWindow];
//    _win = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//       _win.windowLevel = UIWindowLevelAlert;
//       [_win makeKeyAndVisible];
//       _win.backgroundColor = [UIColor clearColor];
//    _win = [UIApplication sharedApplication].keyWindow;
//    [_win addSubview:_areaView];
}

- (void)showWindow{
    _win = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _win.windowLevel = 1000;
//    _win.backgroundColor = [UIColor colorWithRed:225 green:225 blue:225 alpha:0.1];
    _win.backgroundColor = [UIColor clearColor];
    _win.hidden = NO;
    [_win addSubview:_areaView];
//        UIWindow *win = [UIApplication sharedApplication].keyWindow;
//        [win insertSubview:self.mediaPlayer.view atIndex:0];
//    [_win addSubview:self.mediaPlayer.view];
    [_win setHidden:NO];
    [_win makeKeyWindow];
    [_win makeKeyAndVisible];
}

#pragma mark create
+(DFPopupController*)popupViewAddToViewController:(UIViewController*)viewController style:(DFPopupControllerStyle)stype Message:(NSString*)message{
    NSString* imgName;
    NSString* title;
    switch (stype) {
        case DFPopupControllerStyleDefaule:
            imgName = nil;
            title = @"确认";
            break;
        case DFPopupControllerStyleSure:
            imgName = @"DFPopupViewSureImg";
            title = @"确认";
            break;
        case DFPopupControllerStyleError:
            imgName = @"DFPopupViewErrorImg";
            title = @"错误";
            break;
        case DFPopupControllerStyleDanger:
            imgName = @"DFPopupViewDangerImg";
            title = @"危险";
            break;
        default:
            break;
    }
    DFPopupController* popupView = [DFPopupController popupViewWithTitle:title imgName:imgName message:message];
    
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"确认" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {

    }]];
    [viewController presentViewController:popupView animated:YES completion:nil];
    return popupView;
}


+(DFPopupController*)popupViewWithTitle:(NSString*)title message:(NSString*)message inputTextF:(textFieldHandler)textFieldHandler okButton:(buttonHandler)okButtonHandler cancleButton:(buttonHandler)cancleButtonHandler{
    DFPopupController* popupView = [DFPopupController popupViewWithTitle:title imgName:nil message:message];
    [popupView addPopViewTextFieldWithConfigurationHandler:textFieldHandler];
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"确认" style:DFPopViewButtonStyleDefault handler:okButtonHandler]];
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"取消" style:DFPopViewButtonStyleCancle handler:cancleButtonHandler]];
    return popupView;
}


+(DFPopupController*)popupViewWithTitle:(NSString*)title message:(NSString*)message okButton:(buttonHandler)okButtonHandler cancleButton:(buttonHandler)cancleButtonHandler{
    DFPopupController* popupView = [DFPopupController popupViewWithTitle:title imgName:nil message:message];
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"确认" style:DFPopViewButtonStyleDefault handler:okButtonHandler]];
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"取消" style:DFPopViewButtonStyleCancle handler:cancleButtonHandler]];
    return popupView;
}


+(DFPopupController*)popupViewWithTitle:(NSString*)title message:(NSString*)message okButton:(buttonHandler)okButtonHandler{
    DFPopupController* popupView = [DFPopupController popupViewWithTitle:title imgName:nil message:message];
    [popupView addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"确认" style:DFPopViewButtonStyleDefault handler:okButtonHandler]];
    return popupView;
}


+(DFPopupController*)popupViewWithTitle:(NSString*)title imgName:(NSString*)imgName message:(NSString*)message{
    DFPopupController* popupView = [[DFPopupController alloc]init];
    [popupView setTitle:title imgName:imgName message:message];
    popupView.view.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.3];
    return popupView;
}

-(void)addPopViewTextFieldWithConfigurationHandler:(textFieldHandler)textFieldHandler{
    if (!_inputTextFields) {
        _inputTextFields = [NSMutableArray array];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [self createTapGestureRecognizer];
    }
    
    if (_inputTextFields.count > (MAXINPUTTEXTFIELDNUMBER-1)) {
        return;
    }
    DFPopViewTextField* textField = [[DFPopViewTextField alloc]init];
    [_inputTextFields addObject:textField];
    [textField changeUI];
    [_areaView addPopViewTextField:textField];
    textFieldHandler(textField);
    
}

-(void)addPopOtherView:(UIView*)otherView {
    [_areaView addPopOtherView:otherView];
}


-(void)addPopViewButton:(DFPopViewButton*)popViewButton{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    if (_buttons.count > (MAXPOPVIEWBUTTON-1)) {
        return;
    }
    [_buttons addObject:popViewButton];
    popViewButton.delegate = self;
    [_areaView addPopViewButton:popViewButton];
}

-(void)addPopViewButtons:(NSArray*)popViewButtons{
    [popViewButtons enumerateObjectsUsingBlock:^(DFPopViewButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addPopViewButton:obj];
    }];
}


-(void)setTitle:(NSString*)title imgName:(NSString*)imgName message:(NSString*)message{
    _title = title;
    _imgName = imgName;
    _message = message;
    [_areaView setTitle:title imgName:imgName message:message];
}



//当有输入时，创建一个点击事件
-(void)createTapGestureRecognizer{
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(stopEdit)];
    [self.view addGestureRecognizer:tap];
}

-(void)stopEdit{
    if (_inputTextFields.count) {
        [_inputTextFields enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DFPopViewTextField* tf = obj;
            [tf resignFirstResponder];
        }];
    }
}

-(void)loadAreaXib{
//    _areaView = (DFPopupViewArea *)[UINib nibWithNibName:@"DFPopupViewArea" bundle:[NSBundle bundleForClass:[self class]]];
    _areaView = [[[NSBundle bundleWithBundleName:@"SQLPopVC" podName:@"SQLPopVC"] loadNibNamed:@"DFPopupViewArea" owner:self options:nil] lastObject];
//    NSString *path = [build pathForResource:@"SQL" ofType:@"bundle"];
//    _areaView = [[[NSBundle bundleWithPath:path] loadNibNamed:@"DFPopupViewArea" owner:self options:nil] lastObject];
//    _areaView = [NSBundle bundleWithBundleName:@"DFPopupViewArea" podName:@"DFPopupViewArea" Extension:@"xib"];
//    _areaView = [[[NSBundle mainBundle]loadNibNamed:@"DFPopupViewArea" owner:self options:nil] firstObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setImageViewWidth:(CGFloat)width withHeight:(CGFloat)height {
    [_areaView setImageViewWidth:width withHeight:height];
}

#pragma mark 键盘通知
-(void)keyboardWillShow:(NSNotification*)aNotification{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    [self keyboardWillShowAreaViewAnimationKeyHeight:keyboardRect.size.height];
}

-(void)keyboardWillHide:(NSNotification*)aNotification{
    [UIView animateWithDuration:0.4 animations:^{
        self->_areaView.center = CGPointMake(self.view.center.x, self.view.center.y-40);
    }];
}


//有输入框时，键盘弹出动画
-(void)keyboardWillShowAreaViewAnimationKeyHeight:(CGFloat)height{
    [UIView animateWithDuration:0.4 animations:^{
        CGFloat centerY = [UIScreen mainScreen].bounds.size.height - height - self->_areaView.bounds.size.height/2;
        self->_areaView.center = CGPointMake(self.view.center.x, centerY);
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    [self show];
    DFPopupPresentAnimator* animator = [[DFPopupPresentAnimator alloc]init];
    animator.presentStyle = self.presentStyle;
    return animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    DFPopupDismissAnimator* animator = [[DFPopupDismissAnimator alloc]init];
    _win.hidden = YES;
    _win = nil;
    animator.dismissStyle = self.dismissStyle;
    return animator;
}

- (void)addBtnOutAnimation {
    if (!self.onClickNotDidsmiss) {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}



@end
