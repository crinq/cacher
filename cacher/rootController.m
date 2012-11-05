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
    myGPXController = [[gpxController alloc] init];
    return self;
}

- (NSMutableArray *)caches{
    return [myCacheController caches];
}

- (NSMutableArray *)cachesSorted{
    return [myCacheController cachesSorted];
}

- (void)addCache:(cache*)c{
    [[myCacheController caches] addObject:c];
    [[[root get] rootNavController] updateView];
}

- (void)setMaxDistance:(NSUInteger)dist{
    [myConfigController setMaxDistance:dist];
}

- (double)maxDistance{
    return [myConfigController maxDistance];
}

- (bool)sortArray{
    return [myConfigController sortArray];
}

- (pos *)currentPosition{
    return [myGpsController currentPos];
}

-(void)connect{
    [myGpsController connect];
}

-(void)disconnect{
    [myGpsController disconnect];
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
