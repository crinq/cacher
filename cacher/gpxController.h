//
//  gpxController.h
//  cacher
//
//  Created by crinq on 17.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cache.h"
#import "root.h"

@interface gpxController : NSObject{    
    NSXMLParser *rssParser;
    NSMutableArray *articles;
    NSString *currentElement;
    NSMutableString *ElementValue;
    BOOL errorParsing;
    cache *currentCache;
    BOOL valid;
    BOOL name;
    BOOL type;
    
}

@end
