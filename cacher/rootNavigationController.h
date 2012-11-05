//
//  rootNavigationController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "navViewController.h"
#import "cachesNavController.h"
#import "configViewController.h"

@class navViewController;
@class cachesNavController;
@class configViewController;

@interface rootNavigationController : UITabBarController{
    navViewController *myNavView;
    cachesNavController *myCacheNavController;
    configViewController *myConfigViwController;
    
}

- (void)updateView;
@end
