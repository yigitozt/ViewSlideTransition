//
//  Storage.m
//  ViewSlideTansition
//
//  Created by Yigit Ozturk on 14/03/14.
//  Copyright (c) 2014 yigitozturk. All rights reserved.
//
#import "Storage.h"

@implementation Storage

+ ( Storage * )instance {
    static Storage *_instance = nil;
    
    @synchronized ( self ) {
        if ( _instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    
    return _instance;
}


#pragma mark - ANIMATIONCROSSINGCLASS

+(void)makeAnimatedCrossFadeWithFirstView:(UIView *)firstView
                               secondView:(UIView *)secondView
                              mainBigView:(UIView *)mainBigView
                           rotatingObject:(UIView *)rotatingObject
                              currentView:(UIView *)currentView
                        currentController:(UIViewController *)currentController
                  currentLongPressGesture:(UILongPressGestureRecognizer *)currentLongPressGesture
              makeNavigationBarDissappear:(BOOL)makeNavigationBarDissappear
{
    static float swipeAmountStart;
    static float swipeAmountChanged;
    static int viewState;
    static int changeTouchDirection;
    
    CGPoint tapPoint = [currentLongPressGesture locationInView:currentView];
    
    [mainBigView setTranslatesAutoresizingMaskIntoConstraints:YES];
    [firstView setTranslatesAutoresizingMaskIntoConstraints:YES];
    [secondView setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    if(rotatingObject)
        [rotatingObject setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    if(makeNavigationBarDissappear)
    {
        [currentController.navigationController setNavigationBarHidden:YES animated:YES];
    }
    
    if([currentLongPressGesture state] == UIGestureRecognizerStateBegan)
    {
        [UIView animateWithDuration:0.25 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                         animations: ^{
                             firstView.alpha = 0.95f;
                             secondView.alpha = 0.95f;
                             firstView.transform = CGAffineTransformScale(firstView.transform, 0.8f, 0.8f);
                             secondView.transform = CGAffineTransformScale(secondView.transform, 0.8f, 0.8f);
                             
                             if(rotatingObject)
                                 rotatingObject.alpha = 1;
                         }
                         completion: ^ (BOOL finished){
                             
                         }];
        
        swipeAmountStart = 0;
        swipeAmountChanged = 0;
        swipeAmountStart = tapPoint.x;
    }
    else if([currentLongPressGesture state] == UIGestureRecognizerStateChanged)
    {
        swipeAmountChanged = tapPoint.x - swipeAmountStart;
        
        firstView.alpha = ((mainBigView.frame.origin.x + 320) / 320);
        secondView.alpha = (mainBigView.frame.origin.x / -320);
        
        if(rotatingObject)
            rotatingObject.transform = CGAffineTransformMakeRotation((M_PI_2 * mainBigView.frame.origin.x) / 50.0f);
        if(viewState == 0)
        {
            if((320 + swipeAmountChanged) < 200.0f)
                changeTouchDirection = 1;
            else if((320 + swipeAmountChanged) > 210.0f)
                changeTouchDirection = 0;
        }
        else
        {
            if((320 + swipeAmountChanged) > 440.0f)
                changeTouchDirection = 0;
            else if((320 + swipeAmountChanged) < 430.0f)
                changeTouchDirection = 1;
        }
        
        NSLog(@"320+swipe : %f", swipeAmountChanged+320);
        
        if(viewState == 0)
            mainBigView.center = CGPointMake(320 + swipeAmountChanged, mainBigView.center.y);
        else
            mainBigView.center = CGPointMake(swipeAmountChanged, mainBigView.center.y);
    }
    else if([currentLongPressGesture state] == UIGestureRecognizerStateEnded)
    {
        [currentController.navigationController setNavigationBarHidden:NO animated:YES];
        [UIView animateWithDuration:0.25 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                         animations: ^{
                             firstView.alpha = 0.95f;
                             secondView.alpha = 0.95f;
                             firstView.transform = CGAffineTransformScale(firstView.transform, 1.25f, 1.25f);
                             secondView.transform = CGAffineTransformScale(secondView.transform, 1.25f, 1.25f);
                         }
                         completion: ^ (BOOL finished){
                             
                         }];
        
        if(changeTouchDirection == 0)
        {
            viewState = 0;
        }
        else
        {
            viewState = 1;
        }
        
        if(viewState == 0)
        {
            [UIView animateWithDuration:0.3 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                             animations: ^{
                                 mainBigView.center = CGPointMake(320, mainBigView.center.y);
                                 if(rotatingObject)
                                     rotatingObject.transform = CGAffineTransformMakeRotation((-M_PI_2 * mainBigView.frame.origin.x) / 50.0f);
                             }
                             completion: ^ (BOOL finished){
                                 [UIView animateWithDuration:0.3 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                                                  animations: ^{
                                                      if(rotatingObject)
                                                          rotatingObject.alpha = 0;
                                                      
                                                      firstView.alpha = 1;
                                                  }
                                                  completion: ^ (BOOL finished){
                                                      
                                                  }];
                             }];
        }
        else
        {
            [UIView animateWithDuration:0.3 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                             animations: ^{
                                 mainBigView.center = CGPointMake(0.0f, mainBigView.center.y);
                                 if(rotatingObject)
                                     rotatingObject.transform = CGAffineTransformMakeRotation((-M_PI_2 * mainBigView.frame.origin.x) / 50.0f);
                             }
                             completion: ^ (BOOL finished){
                                 [UIView animateWithDuration:0.3 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                                                  animations: ^{
                                                      if(rotatingObject)
                                                          rotatingObject.alpha = 0;
                                                      
                                                      secondView.alpha = 1;
                                                  }
                                                  completion: ^ (BOOL finished){
                                                      
                                                  }];
                             }];
        }
        
        if(rotatingObject)
        {
            [UIView animateWithDuration:0.3 delay: 0 options: UIViewAnimationOptionCurveEaseOut
                             animations: ^{
                                 rotatingObject.alpha = 1;
                             }
                             completion: ^ (BOOL finished){
                                 
                             }];
        }
        
    }
}

@end


