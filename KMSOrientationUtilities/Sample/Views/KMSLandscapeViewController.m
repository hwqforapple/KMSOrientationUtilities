//
//  KMSLandscapeViewController.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSLandscapeViewController.h"

@implementation KMSLandscapeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setTitle: @"Landscape"];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskLandscape;
}

@end
