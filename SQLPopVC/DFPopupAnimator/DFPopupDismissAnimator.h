//
//  DFPopupDismissAnimator.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFPopupHeader.h"

@interface DFPopupDismissAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign)DFPopupDismissStyle dismissStyle;
@end
