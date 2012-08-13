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

-(id)init{
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2JZ38" name:@"cache0" withLongitude:51.9721 andLatitude:7.6225675]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2AJXH" name:@"Cache1" withLongitude:51.973233 andLatitude:7.633183]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC30WTE" name:@"Cache2" withLongitude:51.974967 andLatitude:7.6178]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2ZA0D" name:@"Cache3" withLongitude:51.981667 andLatitude:7.628333]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GCTTTD" name:@"Cache4" withLongitude:51.981467 andLatitude:7.629617]];
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
    
    NSUInteger maxDistance = [[[AppDelegate sharedSingleton] rootControllerSwitch] maxDistance];
    pos *currentPosition = [[[AppDelegate sharedSingleton] rootControllerSwitch] currentPosition];
    
    //for(cache *c in caches){
    //    if([[c GCPos] distanceTo:currentPosition] <= maxDistance){
    //        [filteredCaches addObject:c];
    //    }
    //}
    
    if([[[AppDelegate sharedSingleton] rootControllerSwitch] sortArray]){
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
