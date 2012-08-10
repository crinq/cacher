//
//  pos.h
//  test
//
//  Created by crinq on 03.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pos : NSObject {
    double pi;
    double r;
    double dist;
    double lat;
    double lon;
}

@property double lat;
@property double lon;

- (void)setLatInDeg:(double)latd;
- (void)setLonInDeg:(double)lond;
- (double)latInDeg;
- (double)lonInDeg;
- (double)realDistanceTo:(pos *)pos;
- (double)distanceTo:(pos *)pos;
- (double)dirTo:(pos *)pos;
- (double)dirInDegTo:(pos *)pos;
- (id)initWithLongitudeInDeg:(double)longitude andLatitudeInDeg:(double)latitude;

+ (pos*)stringToPos:(NSString*)position;

@end
