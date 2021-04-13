//
//  DFPopupPresentAnimator.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFPopupHeader.h"

@interface DFPopupPresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign)DFPopupPresentStyle presentStyle;
@end
