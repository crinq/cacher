//
//  cacheController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cache.h"
#import "AppDelegate.h"
#import "pos.h"

@interface cacheController : NSObject{
    NSMutableArray *caches;
    cache *currentCache;
}

@property (readonly) NSMutableArray *caches;
@property () cache *currentCache;

- (cache*) getCacheByGCCode:(NSString*)GCCode;
- (NSMutableArray*) cachesSorted;

@end
