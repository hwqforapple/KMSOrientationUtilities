//
//  KMSApplicationDelegate.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSApplicationDelegate.h"

#import "KMSPortraitViewController.h"
#import "KMSRootViewController.h"

@interface KMSApplicationDelegate() {
	UIWindow* _window;
}

@end

#pragma mark -

@implementation KMSApplicationDelegate

- (BOOL)application: (UIApplication*)application didFinishLaunchingWithOptions: (NSDictionary*)launchOptions {
	UIWindow* window = [[UIWindow alloc] init];
	[window makeKeyAndVisible];
	_window = window;
	
	KMSRootViewController* rootViewController = [[KMSRootViewController alloc] init];
	[window setRootViewController: rootViewController];
	
	KMSPortraitViewController* portraitViewController = [[KMSPortraitViewController alloc] init];
	[rootViewController pushViewController: portraitViewController animated: FALSE];
	
	return TRUE;
}

@end
