//
//  rootNavigationController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "rootNavigationController.h"

@interface rootNavigationController ()

@end

@implementation rootNavigationController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        myNavView = [[navViewController alloc] init];
        myCacheNavController = [[cachesNavController alloc] init];
        myConfigViwController = [[configViewController alloc] init];
        [self addChildViewController:myCacheNavController];
        [self addChildViewController:myNavView];
        [self addChildViewController:myConfigViwController];
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
    [myNavView updateView];
    [myCacheNavController updateView];
    [myConfigViwController updateView];
}

@end
