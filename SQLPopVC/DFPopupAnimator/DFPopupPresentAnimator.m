//
//  DFPopupPresentAnimator.m
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#import "DFPopupController.h"
#import "DFPopupPresentAnimator.h"

@implementation DFPopupPresentAnimator
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.presentStyle) {
        case DFPopupPresentStyleSystem:
            return 0.3;
        case DFPopupPresentStyleFadeIn:
            return 0.2;
        case DFPopupPresentStyleBounce:
            return 0.42;
        case DFPopupPresentStyleExpandHorizontal:
            return 0.3;
        case DFPopupPresentStyleExpandVertical:
            return 0.3;
        case DFPopupPresentStyleSlideDown:
            return 0.5;
        case DFPopupPresentStyleSlideUp:
            return 0.5;
        case DFPopupPresentStyleSlideLeft:
            return 0.4;
        case DFPopupPresentStyleSlideRight:
            return 0.4;
        case DFPopupPresentStyleLeft:
            return 0.4;
    }
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    [self animationWithStyle:self.presentStyle context:transitionContext];
}

-(void)animationWithStyle:(DFPopupPresentStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (style) {
        case DFPopupPresentStyleSystem:
            [self systemAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleFadeIn:
            [self fadeInAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleBounce:
            [self bounceAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleExpandHorizontal:
            [self expandHorizontalAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleExpandVertical:
            [self expandVerticalAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case DFPopupPresentStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
            case DFPopupPresentStyleLeft:
            [self slideSchoolRightAnimationWithContext:transitionContext];
            break;
    }
}

-(void)systemAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.alpha = 0;
    toVC.areaView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.alpha = 1;
                         toVC.areaView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)fadeInAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha = 0;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)bounceAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.alpha = 0;
    toVC.areaView.transform = CGAffineTransformMakeScale(0, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.alpha = 1;
                         toVC.areaView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)expandHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.alpha = 0;
    toVC.areaView.transform = CGAffineTransformMakeScale(0, 1);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.alpha = 1;
                         toVC.areaView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)expandVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.alpha = 0;
    toVC.areaView.transform = CGAffineTransformMakeScale(1, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.alpha = 1;
                         toVC.areaView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.center = CGPointMake(toVC.view.center.x, -toVC.areaView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.center = CGPointMake(toVC.view.center.x, toVC.view.frame.size.height+toVC.areaView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.center = CGPointMake(toVC.view.frame.size.width+toVC.areaView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    DFPopupController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.areaView.center = CGPointMake(-toVC.areaView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = as_backgroundAlpha;
                         toVC.areaView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

-(void)slideSchoolRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
//    DFSchoolDirectoryViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    toVC.backgroundView.alpha = 0;
//    //toVC.schoolView.center = CGPointMake(toVC.view.frame.size.width+toVC.schoolView.frame.size.width/2.0, toVC.view.center.y);
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:toVC.view];
//    
//    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    [UIView animateWithDuration:duration
//                          delay:0
//         usingSpringWithDamping:0.7
//          initialSpringVelocity:0
//                        options:UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                         toVC.backgroundView.alpha = backgroundAlpha;
//                         //toVC.schoolView.center = toVC.view.center;
//                     }
//                     completion:^(BOOL finished) {
//                         [transitionContext completeTransition:YES];
//                     }];
}

@end
