//
//  cachesNavController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cachesNavController.h"

@interface cachesNavController ()

@end

@implementation cachesNavController

- (id)init
{

    self = [super init];
    if (self) {
        // Custom initialization
        myCachesTableView = [[cachesTableViewController alloc] init];
        [self pushViewController:myCachesTableView animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)updateView
{
    NSLog(@"update table nav");
    [myCachesTableView updateView];
}

@end
