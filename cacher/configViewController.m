//
//  navViewController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "configViewController.h"

@interface configViewController ()

@end

@implementation configViewController

- (id)init
{
    
    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:@"Conf"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] init];
    self.view = view;
    [view setBackgroundColor:[UIColor whiteColor]];
    [view setAutoresizesSubviews:YES];
    
    slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(0, 30, 300, slider.frame.size.height);
    [slider setMinimumValue:0];
    [slider setMaximumValue:10];
    [slider setValue:2];
     
    //[slider setEnabled:YES];
    [slider addTarget:self action:@selector(set:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:slider];
    
    label = [[UILabel alloc] init];
    //[label setText:[[NSString alloc] initWithFormat:@"maxDist: %.2fKm", [slider value] * [slider value] / 10]];
    label.frame = CGRectMake(0, 5, 200, 20);
    [view addSubview:label];
    
    [self set:nil];
}

- (void)set:(id)sender{
    [label setText:[[NSString alloc] initWithFormat:@"maxDist: %.2fKm", [slider value] * [slider value] / 10]];
    [[[root get] rootControllerSwitch] setMaxDistance:[slider value] * [slider value] * 100];
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
    if([self isViewLoaded] && self.view.window){
    }
}

@end
