//
//  rootController.m
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "rootController.h"


@implementation rootController


- (id)init
{
    myCacheController = [[cacheController alloc] init];
    myGpsController = [[gpsController alloc] init];
    myConfigController = [[configController alloc] init];
    return self;
}

- (NSMutableArray *)caches{
    return [myCacheController caches];
}

- (NSUInteger)maxDistance{
    return [myConfigController maxDistance];
}

- (pos *)currentPosition{
    return [myGpsController currentPos];
}

@end
