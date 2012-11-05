//
//  cache.h
//  test
//
//  Created by crinq on 03.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pos.h"

@interface cache : NSObject {
    NSString *GCCode;
    NSString *GCName;
    NSString *GCShortInfo;
    NSString *GCInfo;
    pos *GCPos;
    double T;
    double D;
    NSString *GCSize;
    NSString *GCHint;
    NSString *GCType;
}

@property (nonatomic, retain) NSString *GCCode;
@property (nonatomic, retain) NSString *GCName;
@property (nonatomic, retain) NSString *GCShortInfo;
@property (nonatomic, retain) NSString *GCInfo;
@property (nonatomic, retain) pos *GCPos;
@property (nonatomic) double T;
@property (nonatomic) double D;
@property (nonatomic, retain) NSString *GCSize;
@property (nonatomic, retain) NSString *GCHint;
@property (nonatomic, retain) NSString *GCType;



- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitide;
- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLatitude:(double)latitude andLongitude:(double)longitude andInfo:(NSString*)info;
- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitude andInfo:(NSString*)info;

@end