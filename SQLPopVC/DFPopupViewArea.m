//
//  DFPopupViewArea.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/12.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopupViewArea.h"
#import "DFPopupController.h"
#import "NSString+DFPopupString.h"

static const int kMassageFontSize = 18;
static const float kMessaeTextViewMaxHeight = 90.0;

static const float kTextFieldHeight = 40;
static const float kTextFieldspace = 8;

static const float kButtonHeight = 40;
static const float kButtonspace = 8;

static const float kInputTextAreaTopSpace = 20;
static const float kButtonAreaTopSpace = 20;
static const float kSelfCornerRadius = 7;
@interface DFPopupViewArea(){
    NSString*       _title;
    NSString*       _imgName;
    NSString*       _message;
    
    NSMutableArray* _inputTextFields;
    NSMutableArray* _buttons;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UIView *otherArea;
@property (weak, nonatomic) IBOutlet UIView *inputTextArea;
@property (weak, nonatomic) IBOutlet UIView *buttonArea;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewHeigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageTextViewTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageTextViewHeigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageTextViewTrailingSafeArea;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextAreaTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextAreaHeigh;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherAreaTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherAreaHeigh;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonAreaTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonAreaHeigh;
@end

@implementation DFPopupViewArea

- (void)awakeFromNib{
    [super awakeFromNib];
    if (CKDarkMode) {
        self.backgroundColor = CKDarkMode?[UIColor colorWithRed:0x12/255.0f green:0x12/255.0f blue:0x12/255.0f alpha:1.0f]:[UIColor colorWithRed:0xEE/255.0f green:0xEE/255.0f blue:0xEE/255.0f alpha:1.0f];
        self.titleLable.backgroundColor = CKDarkMode?[UIColor colorWithRed:0x1e/255.0f green:0x1e/255.0f blue:0x1e/255.0f alpha:1.0f]:[UIColor whiteColor];
        self.titleLable.textColor = CKDarkMode? [UIColor colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1] : [UIColor colorWithRed:0x11/255.0f green:0x11/255.0f blue:0x11/255.0f alpha:1.0f];
    }
}

-(void)setTitle:(NSString*)title imgName:(NSString*)imgName message:(NSString*)message{
    _title = title;
    _imgName = imgName;
    _message = message;
    _titleLable.text = title;
    if (CKDarkMode) {
        _messageTextView.backgroundColor = CKDarkMode?[UIColor colorWithRed:0x12/255.0f green:0x12/255.0f blue:0x12/255.0f alpha:1.0f]:[UIColor colorWithRed:0xEE/255.0f green:0xEE/255.0f blue:0xEE/255.0f alpha:1.0f];
    }
    else {
        _messageTextView.backgroundColor = [UIColor whiteColor];
    }
    [self changeImgArea];
    [self changeMessageArea];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = kSelfCornerRadius;
}

-(void)addPopViewTextField:(DFPopViewTextField*)popViewTextF{
    if (!_inputTextFields) {
        _inputTextFields = [NSMutableArray array];
    }
    [_inputTextFields addObject:popViewTextF];
    popViewTextF.textColor = CKDarkMode? [UIColor colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1] : [UIColor colorWithRed:0x11/255.0f green:0x11/255.0f blue:0x11/255.0f alpha:1.0f];
    popViewTextF.backgroundColor = CKDarkMode?[UIColor colorWithRed:0x1e/255.0f green:0x1e/255.0f blue:0x1e/255.0f alpha:1.0f]:[UIColor whiteColor];
    [self changeTextFieldArea];
}

-(void)addPopOtherView:(UIView*)otherView {
    _otherAreaTopSpace.constant = kInputTextAreaTopSpace;
    _otherAreaHeigh.constant = otherView.frame.size.height;
//    otherView.frame = CGRectMake(0, 0, self.otherArea.frame.size.width, self.otherArea.frame.size.height - 8);
    otherView.frame = CGRectMake(-20, 0, otherView.frame.size.width, otherView.frame.size.height);
//    otherView.backgroundColor = [UIColor redColor];
    self.otherView = otherView;
    [self.otherArea addSubview:otherView];
//    [otherView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.otherArea.mas_left);
//        make.right.mas_equalTo(self.otherArea.mas_right);
//        make.top.mas_equalTo(self.otherArea.mas_top);
//        make.bottom.mas_equalTo(self.otherArea.mas_bottom).mas_offset(-8);
//    }];
}

-(void)addPopViewButton:(DFPopViewButton*)popViewButton{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    [_buttons addObject:popViewButton];
    [self changeButtonArea];
}

//change textFieldArea
-(void)changeTextFieldArea{
    if (_inputTextFields.count) {
        _inputTextAreaTopSpace.constant = kInputTextAreaTopSpace;
        _inputTextAreaHeigh.constant = _inputTextFields.count * (kTextFieldHeight+kTextFieldspace) - kTextFieldspace;
        
        DFPopViewTextField* field = [_inputTextFields lastObject];
        field.frame = CGRectMake(0, (_inputTextFields.count - 1)*(kTextFieldHeight+kTextFieldspace), _inputTextArea.frame.size.width, kTextFieldHeight);
        [_inputTextArea addSubview:field];
        [field changeUI];
        
    }
}

//change buttonArea
-(void)changeButtonArea{
    if (_buttons.count) {
        _buttonAreaTopSpace.constant = kButtonAreaTopSpace;
        _buttonAreaHeigh.constant = _buttons.count * (kButtonHeight+kButtonspace) - kButtonspace;
        
        DFPopViewButton* button = [_buttons lastObject];
        button.frame = CGRectMake(0, (_buttons.count-1)*(kButtonHeight+kButtonspace), _buttonArea.frame.size.width, kButtonHeight);
        [_buttonArea addSubview:button];
        [button changeUI];
        
    }
}

//图片处理
-(BOOL)isHaveImg{
    if (!_imgName || [_imgName isEqualToString:@""]) {
        return NO;
    }else{
        UIImage* img = [UIImage imageNamed:_imgName];
        if (!img) {
            return NO;
        }else{
            _imgView.image = img;
            return YES;
        }
    }
}

-(void)changeImgArea{
    if (![self isHaveImg]) {
        _imgViewTopSpace.constant = 0;
        _imgViewHeigh.constant = 0;
    }
}

//message处理
-(BOOL)isHaveMessage{
    if (!_message || [_message isEqualToString:@""]) {
        return NO;
    }
    return YES;
}
-(void)changeMessageArea{
    if (![self isHaveMessage]) {
        _messageTextViewTopSpace.constant = 0;
        _messageTextViewHeigh.constant = 0;
    }else{
        CGFloat messageTextMaxWidth = self.frame.size.width - 2*_messageTextViewTrailingSafeArea.constant - 16;
        CGSize size = [_message getStringSizeWithRectSize:CGSizeMake(messageTextMaxWidth, MAXFLOAT) andFontSize:kMassageFontSize];
        if (size.height+16 > kMessaeTextViewMaxHeight) {
            _messageTextViewHeigh.constant = kMessaeTextViewMaxHeight;
            _messageTextView.scrollEnabled = YES;
        }else{
            _messageTextViewHeigh.constant = size.height+16;
            _messageTextView.scrollEnabled = NO;
        }
        _messageTextView.text = _message;
    }
}

-(CGFloat)getAreaHeight{
    return 50 + _imgViewTopSpace.constant + _imgViewHeigh.constant + _messageTextViewTopSpace.constant + _messageTextViewHeigh.constant + _inputTextAreaTopSpace.constant + _inputTextAreaHeigh.constant + _otherAreaTopSpace.constant+_otherAreaHeigh.constant + _buttonAreaTopSpace.constant + _buttonAreaHeigh.constant + 20;
}

-(void)setImageViewWidth:(CGFloat)width withHeight:(CGFloat)height {
    if (width > self.frame.size.width-20) {
        _imgViewWidth.constant = self.frame.size.width-20;
    }
    else {
        _imgViewWidth.constant = width;
    }
    _imgViewHeigh.constant = height;
}

@end
