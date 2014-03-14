//
//  YOViewController.m
//  ViewSlideTansition
//
//  Created by Yigit Ozturk on 14/03/14.
//  Copyright (c) 2014 yigitozturk. All rights reserved.
//

#import "YOViewController.h"
#import "Storage.h"

@interface YOViewController ()

@property(strong, nonatomic)UILongPressGestureRecognizer * tapGesture;

@end

@implementation YOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tapGesture = [UILongPressGestureRecognizer new];
    [self.tapGesture addTarget:self action:@selector(tapScreen:)];
    self.tapGesture.minimumPressDuration = 0.001f;
    [self.view addGestureRecognizer:self.tapGesture];
}

- (IBAction)tapScreen:(id)sender
{
    [Storage makeAnimatedCrossFadeWithFirstView:self.firstView secondView:self.secondView mainBigView:self.mainBigView rotatingObject:self.rotatingObject currentView:self.view currentController:self currentLongPressGesture:self.tapGesture makeNavigationBarDissappear:YES];
}

@end
