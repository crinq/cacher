//
//  root.m
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "root.h"

@implementation root

+ (id)sharedSingleton
{
    static AppDelegate *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[AppDelegate alloc] init];
        return sharedSingleton;
    }
}
@end
