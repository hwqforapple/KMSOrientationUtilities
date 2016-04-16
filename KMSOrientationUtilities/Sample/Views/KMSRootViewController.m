//
//  KMSRootViewController.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSRootViewController.h"

@implementation KMSRootViewController

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
	UIViewController* topViewController = [self topViewController];
	UIInterfaceOrientationMask supportedInterfaceOrientations = [topViewController supportedInterfaceOrientations];
	
	return supportedInterfaceOrientations;
}

@end
