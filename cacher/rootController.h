//
//  rootController.h
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cacheController.h"
#import "gpsController.h"
#import "configController.h"
#import "gpxController.h"
#import "pos.h"

@class cacheController;
@class gpxController;

@interface rootController : NSObject{
    gpsController *myGpsController;
    cacheController *myCacheController;
    configController *myConfigController;
    gpxController *myGPXController;
}


- (NSMutableArray *)caches;
- (NSMutableArray *)cachesSorted;
- (double)maxDistance;
- (void)setMaxDistance:(NSUInteger)dist;
- (bool)sortArray;
- (pos *)currentPosition;
- (cache*) getCacheByGCCode:(NSString*)GCCode;
- (cache*) currentCache;
- (void) setCurrentCache:(cache*)cache;
- (void)addCache:(cache*)c;
-(void)connect;
-(void)disconnect;
@end
