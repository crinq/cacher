//
//  AppDelegate.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rootNavigationController.h"
#import "rootController.h"

@class rootNavigationController;
@class rootController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    rootNavigationController *rootNavController;
    rootController *rootControllerSwitch;
}

@property (strong, nonatomic) UIWindow *window;
@property (readonly) rootNavigationController *rootNavController;
@property (readonly) rootController *rootControllerSwitch;

+ (id)sharedSingleton;

@end
