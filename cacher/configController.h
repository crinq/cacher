//
//  configController.h
//  cacher
//
//  Created by crinq on 13.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface configController : NSObject{
    double maxDistance;
    bool sortArray;
}

@property () double maxDistance;
@property (readonly) bool sortArray;

@end
