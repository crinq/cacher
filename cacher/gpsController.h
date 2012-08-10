//
//  gpsController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BluetoothService.h"
#import "pos.h"


@interface gpsController : NSObject<BluetoothServiceListener>{
    bool isValid;
    pos *currentPos;
}

@property (readonly) bool isValid;
@property (readonly) pos *currentPos;

-(void) messageReceived:(NSString*) message;
    
@end
