//
//  KMSPortraitViewController.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSPortraitViewController.h"

@implementation KMSPortraitViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setTitle: @"Portrait"];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationPortraitUpsideDown;
}

@end
