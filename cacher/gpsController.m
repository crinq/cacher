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
    [[[AppDelegate sharedSingleton] rootNavController] updateView];
    NSLog(@"msg");
}

- (id)init{
    BluetoothService* bt = [BluetoothService sharedInstance];
	[bt addListener:self];
    [bt activate];

    currentPos = [[pos alloc] initWithLongitudeInDeg:7.622567 andLatitudeInDeg:51.97215];
    return self;;
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
                currentPos = [[pos alloc] initWithLongitudeInDeg:lat andLatitudeInDeg:lon];
                
                //              s = [[tmp objectAtIndex:1] intValue] % 100;
                //				m = ([[tmp objectAtIndex:1] intValue] % 10000 - s) / 100;
                //				h = ([[tmp objectAtIndex:1] intValue] - s - m) / 10000 + 1;
            }
            else{
                //data not valid
                isValid = FALSE;
            }
            //[[mvc view] updateView];
        }
    }
}

@end
