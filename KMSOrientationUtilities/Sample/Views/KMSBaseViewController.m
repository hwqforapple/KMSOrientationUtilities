//
//  KMSBaseViewController.m
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

#import "KMSBaseViewController.h"

#import "KMSLandscapeViewController.h"
#import "KMSOrientationUtilities.h"
#import "KMSPortraitViewController.h"
#import "KMSPortraitViewController.h"

@implementation KMSBaseViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIView* rootView = [self view];
	CGRect rootBounds = [rootView bounds];
	
	UIView* buttonPanel = [[UIView alloc] initWithFrame: CGRectMake(CGRectGetMidX(rootBounds) - 50, CGRectGetMidY(rootBounds) - 50, 100, 100)];
	[buttonPanel setAutoresizingMask: UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
	[rootView addSubview: buttonPanel];
	
	UIButton* portraitButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 100, 30)];
	[portraitButton addTarget: self action: @selector(pushPortraitViewController) forControlEvents: UIControlEventTouchUpInside];
	[portraitButton setTitle: @"Portrait" forState: UIControlStateNormal];
	[buttonPanel addSubview: portraitButton];
	
	UIButton* landscapeButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 35, 100, 30)];
	[landscapeButton addTarget: self action: @selector(pushLandscapeViewController) forControlEvents: UIControlEventTouchUpInside];
	[landscapeButton setTitle: @"Landscape" forState: UIControlStateNormal];
	[buttonPanel addSubview: landscapeButton];
	
	UIButton* closeButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 70, 100, 30)];
	[closeButton addTarget: self action: @selector(pop) forControlEvents: UIControlEventTouchUpInside];
	[closeButton setTitle: @"Close" forState: UIControlStateNormal];
	[buttonPanel addSubview: closeButton];
}

- (IBAction)pushPortraitViewController {
	UINavigationController* navigationController = [self navigationController];
	
	KMSPortraitViewController* portraitViewController = [[KMSPortraitViewController alloc] init];
	[navigationController pushViewController: portraitViewController animated: TRUE];
}


- (IBAction)pushLandscapeViewController {
	UINavigationController* navigationController = [self navigationController];
	
	KMSLandscapeViewController* landscapeViewController = [[KMSLandscapeViewController alloc] init];
	[navigationController pushViewController: landscapeViewController animated: TRUE];
}

- (IBAction)pop {
	UINavigationController* navigationController = [self navigationController];
	[navigationController popViewControllerAnimated: TRUE];
}

- (void)viewWillAppear: (BOOL)animated {
	[super viewWillAppear: animated];
	
	[UIDevice attemptRotationToSupportedOrientations];
}

@end
