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

- (bool)sortArray{
    return [myConfigController sortArray];
}

- (pos *)currentPosition{
    return [myGpsController currentPos];
}

- (cache*) getCacheByGCCode:(NSString*)GCCode{
    return [myCacheController getCacheByGCCode:GCCode];
}

- (void) setCurrentCache:(cache*)cache{
    [myCacheController setCurrentCache:cache];
}

- (cache*) currentCache{
    return [myCacheController currentCache];
}

@end
