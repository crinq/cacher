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
#import "pos.h"

@class cacheController;

@interface rootController : NSObject{
    gpsController *myGpsController;
    cacheController *myCacheController;
    configController *myConfigController;
}


- (NSMutableArray *)caches;
- (NSUInteger)maxDistance;
- (bool)sortArray;
- (pos *)currentPosition;


@end
