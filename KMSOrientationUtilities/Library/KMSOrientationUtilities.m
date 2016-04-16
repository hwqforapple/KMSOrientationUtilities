//
//  KMSOrientationUtilities.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSOrientationUtilities.h"

static inline BOOL orientationSupported(
	NSInteger orientation, NSInteger supportedOrientations
) {
	BOOL supported = (supportedOrientations & (1 << orientation)) != 0;
	
	return supported;
}

static inline NSInteger rotateOrientationBy90CW(NSInteger orientation) {
	switch(orientation) {
		case UIDeviceOrientationPortrait:
		return UIDeviceOrientationLandscapeRight;
		
		case UIDeviceOrientationPortraitUpsideDown:
		return UIDeviceOrientationLandscapeLeft;
		
		case UIDeviceOrientationLandscapeLeft:
		return UIDeviceOrientationPortrait;
		
		case UIDeviceOrientationLandscapeRight:
		return UIDeviceOrientationPortraitUpsideDown;
		
		default:
		return UIDeviceOrientationUnknown;
	}
}

static inline NSInteger rotateOrientationBy180CW(NSInteger orientation) {
	switch(orientation) {
		case UIDeviceOrientationPortrait:
		return UIDeviceOrientationPortraitUpsideDown;
		
		case UIDeviceOrientationPortraitUpsideDown:
		return UIDeviceOrientationPortrait;
		
		case UIDeviceOrientationLandscapeLeft:
		return UIDeviceOrientationLandscapeRight;
		
		case UIDeviceOrientationLandscapeRight:
		return UIDeviceOrientationLandscapeLeft;
		
		default:
		return UIDeviceOrientationUnknown;
	}
}

static inline NSInteger rotateOrientationBy270CW(NSInteger orientation) {
	switch(orientation) {
		case UIDeviceOrientationPortrait:
		return UIDeviceOrientationLandscapeLeft;
		
		case UIDeviceOrientationPortraitUpsideDown:
		return UIDeviceOrientationLandscapeRight;
		
		case UIDeviceOrientationLandscapeLeft:
		return UIDeviceOrientationPortraitUpsideDown;
		
		case UIDeviceOrientationLandscapeRight:
		return UIDeviceOrientationPortrait;
		
		default:
		return UIDeviceOrientationUnknown;
	}
}

#pragma mark -

@implementation UIDevice(KMSOrientationUtilities)

+ (void)attemptRotationToSupportedOrientations {
	UIDevice* device = [UIDevice currentDevice];
	UIApplication* application = [UIApplication sharedApplication];
	
	UIViewController* activeViewController = ^ {
		UIWindow* keyWindow = [application keyWindow];
		UIViewController* rootViewController = [keyWindow rootViewController];
		
		UIViewController* activeViewController = nil;
		for(
			UIViewController* viewController = rootViewController;
			viewController != nil;
			viewController = [viewController presentedViewController]
		) {
			activeViewController = viewController;
		}
		
		return activeViewController;
	} ();
	if(activeViewController == nil) {
		return;
	}
	
	NSInteger supportedOrientations = [activeViewController supportedInterfaceOrientations];
	
	NSInteger interfaceOrientation = [application statusBarOrientation];
	if(orientationSupported(interfaceOrientation, supportedOrientations)) {
		return;
	}
	
	NSInteger deviceOrientation = [device orientation];
	if(!UIDeviceOrientationIsValidInterfaceOrientation(deviceOrientation)) {
		return;
	}
	
	NSInteger preferredDeviceOrientation = ^ {
#define returnOrientationIfSupported(orientation) \
{\
	NSInteger __orientation = orientation;\
	if(orientationSupported(__orientation, supportedOrientations)) {\
		return __orientation;\
	}\
}
		
		returnOrientationIfSupported(deviceOrientation)
		returnOrientationIfSupported(rotateOrientationBy90CW(deviceOrientation))
		returnOrientationIfSupported(rotateOrientationBy270CW(deviceOrientation))
		returnOrientationIfSupported(rotateOrientationBy180CW(deviceOrientation))
		
#undef returnOrientationIfSupported
		
		return UIDeviceOrientationUnknown;
	} ();
	if(preferredDeviceOrientation == UIDeviceOrientationUnknown) {
		return;
	}
	
	@try {
#if FALSE
		if(preferredDeviceOrientation == deviceOrientation) {
			[device kms_setOrientation: UIDeviceOrientationUnknown];
			[device kms_setOrientation: deviceOrientation];
		}
		else {
			[device kms_setOrientation: preferredDeviceOrientation];
			[device kms_setOrientation: deviceOrientation];
		}
#else
		NSInteger tempDeviceOrientation = (
			(preferredDeviceOrientation == deviceOrientation) ?
			UIDeviceOrientationUnknown :
			preferredDeviceOrientation
		);
		[device kms_setOrientation: tempDeviceOrientation];
		
		[device kms_setOrientation: deviceOrientation];
#endif
	}
	@catch(NSException* e) {
		// Ignore the exception.
	}
}

- (void)kms_setOrientation: (UIDeviceOrientation)orientation {
	[self setValue: @(orientation) forKey: @"orientation"];
}

@end
