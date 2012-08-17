//
//  pos.m
//  test
//
//  Created by crinq on 03.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "pos.h"

@implementation pos

@synthesize lat;
@synthesize lon;

- (id)initWithLongitudeInDeg:(double)longitude andLatitudeInDeg:(double)latitude{
    pi = 3.1415926;
    r = 6378388.0;
    dist = 111300.0;
    [self setLatInDeg:latitude];
    [self setLonInDeg:longitude];
    return self;
}

- (id)init{
    return [self initWithLongitudeInDeg:0.0 andLatitudeInDeg:0.0];;
}

- (void)setLatInDeg:(double)latd {
    lat = latd * pi / 180.0;
}

- (void)setLonInDeg:(double)lond {
    lon = lond * pi / 180.0;
}

- (double)latInDeg{
    return(lat / pi * 180.0);
}

- (double)lonInDeg{
    return(lon / pi * 180.0);
}

- (double)realDistanceTo:(pos *)pos{
    return(r * acos(sin(lat) * sin(pos.lat) + cos(lat) * cos(pos.lat) * cos(pos.lon - lon)));
}

- (double)distanceTo:(pos *)pos{
    double dlon = dist * cos(lat) * (pos.lon - lon) / pi * 180.0;
    double dlat = dist * (pos.lat - lat) / pi * 180.0;
/*    NSLog(@"dist: %f", dist);
    NSLog(@"lat: %f", lat);
    NSLog(@"lon: %f", lon);
    NSLog(@"pos.lon: %f", pos.lon);
 */   
    NSLog(@"dlon: %fm", dlon);
    NSLog(@"dlat: %fm", dlat);
    
    return(sqrt(dlon * dlon + dlat * dlat));
}

- (double)dirTo:(pos *)pos{
    double dlon = dist * cos(lat) * (lon - pos.lon) / pi * 180.0;
    double dlat = dist * (lat - pos.lat) / pi * 180.0;
    
    if((dlon == 0.0 || dlon == -0.0) && (dlat == 0.0 || dlat == -0.0)){
        return 0.0;
    }
    
    float result = atan2(-dlon, -dlat);
    
    if(result < 0){
        return (2 * pi + result);
    }
    else{
        return abs(result);
    }
}

- (double)dirInDegTo:(pos *)pos {
    return([self dirTo:pos] / pi * 180.0);
}

+ (pos*)stringToPos:(NSString *)position{
    pos* newpos = [[pos alloc] init];
    
    return newpos;
}

@end
