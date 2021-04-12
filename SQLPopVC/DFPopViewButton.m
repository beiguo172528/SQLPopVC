//
//  DFPopViewButton.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/13.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopViewButton.h"
#import "UIColor+DFToolColor.h"

@interface DFPopViewButton(){
    NSString*               _title;
    DFPopViewButtonStyle    _style;
    ButtonBlock             _handler;
    int                     _layerNum;
}

@end

@implementation DFPopViewButton

+(DFPopViewButton*)popViewButtonWithTitle:(NSString*)title style:(DFPopViewButtonStyle)buttonStyle handler:(ButtonBlock)handler{
    DFPopViewButton* button = [DFPopViewButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title style:buttonStyle handler:handler];
    return button;
}

-(void)setTitle:(NSString*)title style:(DFPopViewButtonStyle)buttonStyle handler:(ButtonBlock)handler{
    _title = title;
    _style = buttonStyle;
    _handler = handler;
    [self addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self addObserver:self forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)changeUI{
    switch (_style) {
        case DFPopViewButtonStyleDefault:
        {
            _layerNum = 0;
            if (self.enabled) {
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self .layer insertSublayer:[UIColor setGradualChangingColor:self fromColorStr:@"00a2ff" toColorStr:@"2ddaff"] atIndex:_layerNum];
            }else{
                [self.layer insertSublayer:[UIColor setGradualChangingColor:self fromColorStr:@"dddddd" toColorStr:@"dddddd"] atIndex:_layerNum];
                [self setTitleColor:[UIColor colorWithHex:@"777777"] forState:UIControlStateNormal];
            }
        }
            break;
        case DFPopViewButtonStyleCancle:
        {
            if (self.enabled) {
                [self setTitleColor:[UIColor colorWithHex:@"8C8C8C"] forState:UIControlStateNormal];
            }else{
                self.backgroundColor = [UIColor colorWithHex:@"dddddd"];
                [self setTitleColor:[UIColor colorWithHex:@"777777"] forState:UIControlStateNormal];
            }
            
        }
            break;
            
        default:
            break;
    }
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = 3;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
}

-(void)onClickButton{
    [_delegate addBtnOutAnimation];
    _handler(self);
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"enabled"]) {
        NSNumber * num = change[@"new"];
        if ([change[@"new"] isEqual:change[@"old"]]) {
            return;
        }
        if ([num  isEqual: @1]) {
            switch (_style) {
                case DFPopViewButtonStyleDefault:
                {
                    _layerNum ++;
                    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [self.layer insertSublayer:[UIColor setGradualChangingColor:self fromColorStr:@"00a2ff" toColorStr:@"2ddaff"] atIndex:_layerNum];
                }
                    
                    break;
                case DFPopViewButtonStyleCancle:
                    self.backgroundColor = [UIColor whiteColor];
                    [self setTitleColor:[UIColor colorWithHex:@"8C8C8C"] forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
            
        }else{
            switch (_style) {
                case DFPopViewButtonStyleDefault:
                    _layerNum ++;
                    [self setTitleColor:[UIColor colorWithHex:@"777777"] forState:UIControlStateNormal];
                    [self.layer insertSublayer:[UIColor setGradualChangingColor:self fromColorStr:@"dddddd" toColorStr:@"dddddd"] atIndex:_layerNum];
                    
                    break;
                case DFPopViewButtonStyleCancle:
                    self.backgroundColor = [UIColor colorWithHex:@"dddddd"];
                    [self setTitleColor:[UIColor colorWithHex:@"777777"] forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
           
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"enabled"];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
