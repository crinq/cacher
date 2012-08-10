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
    NSString *GCInfo;
    pos *GCPos;
}

@property (nonatomic, retain) NSString *GCCode;
@property (nonatomic, retain) NSString *GCName;
@property (nonatomic, retain) NSString *GCInfo;
@property (nonatomic, retain) pos *GCPos;

- (id)initWithGCCode:(NSString*)code name:(NSString*)name withLongitude:(double)longitude andLatitude:(double)latitide;

@end