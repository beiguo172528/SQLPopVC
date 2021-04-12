//
//  DFPopupDismissAnimator.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopupController.h"
#import "DFPopupDismissAnimator.h"

@implementation DFPopupDismissAnimator
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case DFPopupDismissStyleFadeOut:
            return 0.15;
        case DFPopupDismissStyleContractHorizontal:
            return 0.2;
        case DFPopupDismissStyleContractVertical:
            return 0.2;
        case DFPopupDismissStyleSlideDown:
            return 0.25;
        case DFPopupDismissStyleSlideUp:
            return 0.25;
        case DFPopupDismissStyleSlideLeft:
            return 0.2;
        case DFPopupDismissStyleSlideRight:
            return 0.2;
        case DFPopupDismissStyleRight:
            return 0.2;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.dismissStyle context:transitionContext];
}

- (void)animateWithStyle:(DFPopupDismissStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case DFPopupDismissStyleFadeOut:
            [self fadeOutAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleContractHorizontal:
            [self contractHorizontalAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleContractVertical:
            [self contractVerticalAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
        case DFPopupDismissStyleRight:
            [self slideSchoolRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)fadeOutAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
     DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.transform = CGAffineTransformMakeScale(0.001, 1);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.transform = CGAffineTransformMakeScale(1, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.center = CGPointMake(fromVC.view.center.x, fromVC.view.frame.size.height + fromVC.areaView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.center = CGPointMake(fromVC.view.center.x, -fromVC.areaView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.center = CGPointMake(-fromVC.areaView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DFPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.areaView.center = CGPointMake(fromVC.view.frame.size.width + fromVC.areaView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideSchoolRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {

}

@end
