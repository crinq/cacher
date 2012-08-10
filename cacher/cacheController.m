//
//  cacheController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cacheController.h"

@implementation cacheController

- (cache*) getCacheByGCCode:(NSString*)GCCode{
    NSInteger index =  [caches indexOfObjectPassingTest:
        ^ (id obj, NSUInteger idx, BOOL *stop)
        {
            if ([[obj GCCode] caseInsensitiveCompare: GCCode] == NSOrderedSame)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }];
    return [caches objectAtIndex:index];
}

@end
