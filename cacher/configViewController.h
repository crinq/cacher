//
//  navViewController.h
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "root.h"


@interface configViewController : UIViewController{
    UISlider *slider;
    UILabel *label;
    
}

- (void)updateView;
- (void)set:(id)sender;

@end
