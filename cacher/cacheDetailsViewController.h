//
//  cacheDetailsViewController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pos.h"
#import "cache.h"
#import "root.h"

@interface cacheDetailsViewController : UIViewController{
}

- (id)initWithGCCode:(NSString *)GCCode;
- (void)updateView;

@end
