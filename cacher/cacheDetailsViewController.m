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

- (void)addCache
{
    cache *currentCache = [[[root get] rootControllerSwitch] getCacheByGCCode:[self title]];
    [[[root get] rootControllerSwitch] setCurrentCache:currentCache];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setNumberOfLines:0];
    self.view = myLabel;
    
    NSMutableString* content = [[NSMutableString alloc] init];
    pos *currentpos = [[[root get] rootControllerSwitch] currentPosition];
    cache *cache = [[[root get] rootControllerSwitch] getCacheByGCCode:[self title]];
    
    [content appendFormat:@"GCCode: %@\n", [cache GCCode]];
    [content appendFormat:@"GCName: %@\n", [cache GCName]];
    if([[cache GCPos] distanceTo:currentpos] > 1000.0){
        [content appendFormat:@"Distance: %fKm\n", [currentpos distanceTo:[cache GCPos]] / 1000.0];
    }
    else{
        [content appendFormat:@"Distance: %fm\n", [currentpos distanceTo:[cache GCPos]]];
    }
    [content appendFormat:@"Direction: %f\n", [currentpos dirInDegTo:[cache GCPos]]];
    [content appendFormat:@"GCInfo: %@\n", [cache GCInfo]];
    
    [myLabel setText:content];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"GO" style:UIBarButtonSystemItemDone target:self action:@selector(addCache)];
    self.navigationItem.rightBarButtonItem = rightButton;
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
