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
@synthesize GCShortInfo;
@synthesize GCPos;
@synthesize T;
@synthesize D;
@synthesize GCSize;
@synthesize GCHint;
@synthesize GCType;


- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitude{
    self.GCCode = code;
    self.GCName = name;
    self.GCInfo = @"";
    self.GCPos = [[pos alloc] initWithLongitudeInDeg:longitude andLatitudeInDeg:latitude];
    return [super init];
}

- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLatitude:(double)latitude andLongitude:(double)longitude andInfo:(NSString*)info{
    self.GCCode = code;
    self.GCName = name;
    self.GCPos = [[pos alloc] initWithLongitudeInDeg:longitude andLatitudeInDeg:latitude];
    self.GCInfo = info;
    return [super init];
}

- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitude andInfo:(NSString*)info{
    self.GCCode = code;
    self.GCName = name;
    self.GCPos = [[pos alloc] initWithLongitudeInDeg:longitude andLatitudeInDeg:latitude];
    self.GCInfo = info;
    return [super init];
}

@end
