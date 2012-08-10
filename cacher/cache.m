//
//  cache.m
//  test
//
//  Created by crinq on 03.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cache.h"

@implementation cache

@synthesize GCCode;
@synthesize GCName;
@synthesize GCInfo;
@synthesize GCPos;

- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitude{
    self.GCCode = code;
    self.GCName = name;
    self.GCPos = [[pos alloc] initWithLongitudeInDeg:longitude andLatitudeInDeg:latitude];
    return [super init];
}

@end
