//
//  gpsController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "gpsController.h"
#import "AppDelegate.h"

@implementation gpsController

@synthesize isValid;
@synthesize currentPos;

-(void) messageReceived:(NSString*) message
{
    [self parse:message];
}

- (id)init{
    bt = [BluetoothService sharedInstance];
	[bt addListener:self];
//50.263483" lon="8.664883
    currentPos = [[pos alloc] initWithLongitudeInDeg:8.664883 andLatitudeInDeg:50.263483];
    return self;;
}

-(void)connect{
    [bt activate];
}

-(void)disconnect{
    [bt deactivate];
}


- (void)parse:(NSString*)data{
    NSArray *tmp = [data componentsSeparatedByString:@","];
    
    if([tmp count] > 0){
        if([[tmp objectAtIndex:0] isEqualToString:@"$GPRMC"] && [tmp count] == 13){
            if([[tmp objectAtIndex:2] isEqualToString:@"A"]){
                //data valid
                isValid = TRUE;
                
                //parse lat
                double lat = [[tmp objectAtIndex:3] doubleValue];
				lat = (lat - fmod(lat, 100)) / 100 + fmod(lat, 100) / 60;
				if ([tmp objectAtIndex:4] == @"S") {
					lat = - lat;
				}
				
                //parse lon
				double lon = [[tmp objectAtIndex:5] doubleValue];
				lon = (lon - fmod(lon, 100)) / 100 + fmod(lon, 100) / 60;
				if ([tmp objectAtIndex:6] == @"W") {
					lon = - lon;
				}
                
                //save data
                currentPos = [[pos alloc] initWithLongitudeInDeg:lon andLatitudeInDeg:lat];
                
                //              s = [[tmp objectAtIndex:1] intValue] % 100;
                //				m = ([[tmp objectAtIndex:1] intValue] % 10000 - s) / 100;
                //				h = ([[tmp objectAtIndex:1] intValue] - s - m) / 10000 + 1;
            }
            else{
                //data not valid
                isValid = FALSE;
            }
            [[[root get] rootNavController] updateView];
        }
    }
}

@end
