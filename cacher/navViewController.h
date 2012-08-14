//
//  navViewController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "root.h"
#import "cache.h"
#import "pos.h"


@interface navViewController : UIViewController{
    UILabel *label;
}

- (void)updateView;
@end
