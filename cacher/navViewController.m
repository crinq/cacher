//
//  navViewController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "navViewController.h"

@interface navViewController ()

@end

@implementation navViewController

- (id)init
{

    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:@"Nav"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    label = [[UILabel alloc] init];
    [label setNumberOfLines:0];
    self.view = label;
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
    NSMutableString* content = [[NSMutableString alloc] init];
    pos *currentpos = [[[root get] rootControllerSwitch] currentPosition];
    cache *cache = [[[root get] rootControllerSwitch] currentCache];
    
    [content appendFormat:@"GCCode: %@\n", [cache GCCode]];
    [content appendFormat:@"GCName: %@\n", [cache GCName]];
    [content appendFormat:@"GCPos: %f\t%f\n", [[cache GCPos] latInDeg], [[cache GCPos] lonInDeg]];
    [content appendFormat:@"myPos: %f\t%f\n", [currentpos latInDeg], [currentpos lonInDeg]];
    NSLog(@"dist: %f", [currentpos distanceTo:[cache GCPos]]);
    
    if([currentpos distanceTo:[cache GCPos]] > 1000.0){
        [content appendFormat:@"Distance: %fKm\n", [currentpos distanceTo:[cache GCPos]] / 1000.0];
    }
    else{
        [content appendFormat:@"Distance: %fm\n", [currentpos distanceTo:[cache GCPos]]];
    }
    
    //[content appendFormat:@"Distance: %f\n", [[cache GCPos] distanceTo:currentpos]];
    [content appendFormat:@"Direction: %f\n", [currentpos dirInDegTo:[cache GCPos]]];
    [content appendFormat:@"GCInfo: %@\n", [cache GCInfo]];
    
    [label setText:content];
    self.view = label;
}

@end
