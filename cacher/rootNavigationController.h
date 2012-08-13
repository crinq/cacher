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

@class cachesNavController;

@interface rootNavigationController : UITabBarController{
    navViewController *myNavView;
    cachesNavController *myCacheNavController;
}

- (void)updateView;
@end
