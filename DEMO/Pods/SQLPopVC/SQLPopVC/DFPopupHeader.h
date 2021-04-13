//
//  DFPopupHeader.h
//  DFPopupView12
//
//  Created by DOFAR on 2018/10/15.
//  Copyright © 2018年 DOFAR. All rights reserved.
//

#ifndef DFPopupHeader_h
#define DFPopupHeader_h

/** present style */
typedef NS_ENUM(NSInteger, DFPopupPresentStyle) {
    DFPopupPresentStyleSystem,          // 系统样式
    DFPopupPresentStyleFadeIn,          // 渐入
    DFPopupPresentStyleBounce,          // 弹出
    DFPopupPresentStyleExpandHorizontal,// 水平展开
    DFPopupPresentStyleExpandVertical,  // 垂直展开
    DFPopupPresentStyleSlideDown,       // 从上往下划入
    DFPopupPresentStyleSlideUp,         // 从下往上划入
    DFPopupPresentStyleSlideLeft,       // 从右往左划入
    DFPopupPresentStyleSlideRight,      // 从左往右划入
    DFPopupPresentStyleLeft             // 学校目录从左往右划入
};

/** dismiss style */
typedef NS_ENUM(NSInteger, DFPopupDismissStyle) {
    DFPopupDismissStyleFadeOut,             // 渐出
    DFPopupDismissStyleContractHorizontal,  // 水平收起
    DFPopupDismissStyleContractVertical,    // 垂直收起
    DFPopupDismissStyleSlideDown,           // 向下划出
    DFPopupDismissStyleSlideUp,             // 向上划出
    DFPopupDismissStyleSlideLeft,           // 向左划出
    DFPopupDismissStyleSlideRight,          // 向右划出
    DFPopupDismissStyleRight                // 学校目录划出
};

#endif /* DFPopupHeader_h */
