//
//  root.h
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rootNavigationController.h"
#import "rootController.h"

@class rootNavigationController;
@class rootController;

@interface root : NSObject{
    rootNavigationController *rootNavController;
    rootController *rootControllerSwitch;
}

@property (readonly) rootNavigationController *rootNavController;
@property (readonly) rootController *rootControllerSwitch;

+ (id)get;
@end
