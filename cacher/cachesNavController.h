//
//  cachesNavController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cachesTableViewController.h"

@class cachesTableViewController;

@interface cachesNavController : UINavigationController{
    cachesTableViewController *myCachesTableView;
}

- (void)updateView;
@end
