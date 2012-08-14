//
//  cacheController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cacheController.h"

@implementation cacheController

@synthesize caches;
@synthesize currentCache;

-(id)init{
    caches = [[NSMutableArray alloc] init];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2JZ38" name:@"cache0" withLongitude:8.435700 andLatitude:54.715600]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2AJXH" name:@"Cache1" withLongitude:8.500000 andLatitude:54.733333]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC30WTE" name:@"Cache2" withLongitude:8.487500 andLatitude:54.689483]];

    NSLog(@"cachcount: %d", [caches count]);
    return self;
}
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

- (NSArray*) cachesSortedWithMaxDistance{
    NSMutableArray *filteredCaches = [[NSMutableArray alloc] init];
    
    NSUInteger maxDistance = [[[root get] rootControllerSwitch] maxDistance];
    pos *currentPosition = [[[root get] rootControllerSwitch] currentPosition];
    
    //for(cache *c in caches){
    //    if([[c GCPos] distanceTo:currentPosition] <= maxDistance){
    //        [filteredCaches addObject:c];
    //    }
    //}
    
    if([[[root get] rootControllerSwitch] sortArray]){
        //return [filteredCaches sortedArrayUsingFunction:sort context:(void*)currentPosition];
    }
    return filteredCaches;
}

NSInteger sort(id cache1, id cache2, void* position)
{
    if([[cache1 GCPos] distanceTo:CFBridgingRelease(position)] > [[cache2 GCPos] distanceTo:CFBridgingRelease(position)]){
        return NSOrderedDescending;
    }
    return NSOrderedAscending;
}

@end
