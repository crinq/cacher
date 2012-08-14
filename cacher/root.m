//
//  root.m
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "root.h"

@implementation root

@synthesize rootControllerSwitch;
@synthesize rootNavController;


-(id)init{
    self = [super init];
    if (self) {
        // Custom initialization
        rootControllerSwitch = [[rootController alloc] init];
        rootNavController = [[rootNavigationController alloc] init];
    }
    return self;
}

+ (id)get
{
    static root *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[root alloc] init];
        return sharedSingleton;
    }
}
@end
