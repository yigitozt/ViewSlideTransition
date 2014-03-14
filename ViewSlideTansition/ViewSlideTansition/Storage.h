//
//  Storage.h
//  ViewSlideTansition
//
//  Created by Yigit Ozturk on 14/03/14.
//  Copyright (c) 2014 yigitozturk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Storage : NSObject

#pragma mark - ANIMATIONCROSSINGCLASS
+(void)makeAnimatedCrossFadeWithFirstView:(UIView *)firstView
                               secondView:(UIView *)secondView
                              mainBigView:(UIView *)mainBigView
                           rotatingObject:(UIView *)rotatingObject
                              currentView:(UIView *)currentView
                        currentController:(UIViewController *)currentController
                  currentLongPressGesture:(UILongPressGestureRecognizer *)currentLongPressGesture
              makeNavigationBarDissappear:(BOOL)makeNavigationBarDissappear;


@end
