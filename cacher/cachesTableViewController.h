//
//  cachesTableViewController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cacheDetailsViewController.h"

@interface cachesTableViewController : UITableViewController{
    cacheDetailsViewController *cacheDetails;
}

- (void)updateView;
@end
