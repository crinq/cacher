//
//  configController.m
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "configController.h"

@implementation configController

@synthesize maxDistance;

-(id)init{
    maxDistance = 1;
    sortArray = YES;
    return self;
}

@end
