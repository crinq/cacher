//
//  cacheDetailsViewController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cacheDetailsViewController.h"

@interface cacheDetailsViewController ()

@end

@implementation cacheDetailsViewController

- (id)initWithGCCode:(NSString *)GCCode
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:GCCode];
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

}

@end
