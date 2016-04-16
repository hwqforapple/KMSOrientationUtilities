//
//  KMSOrientationUtilities.h
//  KMSOrientationUtilities
//
//  Created by 傅立业 on 16/4/16.
//  Copyright © 2016年 Kirisame Magic Shop. All rights reserved.
//

@import UIKit;

@interface UIDevice(KMSOrientationUtilities)

/**
 * If the active view controller is not currently in its supported interface 
 * orientation, perform a fake device rotation to let it have a chance to rotate
 * to one of its supported interface orientations.
 */
+ (void)attemptRotationToSupportedOrientations;

@end
