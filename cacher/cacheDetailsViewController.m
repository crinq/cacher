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
    //UILabel *myLabel = [[UILabel alloc] init];
    //UITextView *myLabel = [[UITextView alloc] init];
    //[myLabel setEditable:FALSE];
    UIWebView *myLabel = [[UIWebView alloc] init];
    //[myLabel setNumberOfLines:0];
    self.view = myLabel;
    
    NSMutableString* content = [[NSMutableString alloc] init];
    pos *currentpos = [[[root get] rootControllerSwitch] currentPosition];
    cache *cache = [[[root get] rootControllerSwitch] getCacheByGCCode:[self title]];
    
    [content appendFormat:@"GCCode: %@<br>", [cache GCCode]];
    [content appendFormat:@"GCName: %@<br>", [cache GCName]];
    if([[cache GCPos] distanceTo:currentpos] > 1000.0){
        [content appendFormat:@"Distance: %.3fKm<br>", [currentpos distanceTo:[cache GCPos]] / 1000.0];
    }
    else{
        [content appendFormat:@"Distance: %.1fm<br>", [currentpos distanceTo:[cache GCPos]]];
    }
    [content appendFormat:@"Direction: %.0f<br>", [currentpos dirInDegTo:[cache GCPos]]];
    [content appendFormat:@"GCInfo: %@<br>", [cache GCShortInfo]];
    [content appendFormat:@"%@<br><br>", [cache GCInfo]];
    [content appendFormat:@"GCHint: %@", [cache GCHint]];

    //[myLabel setDirectionalLockEnabled:NO];
    //[myLabel setValue:content forKey:@"contentToHTMLString"];
    //[myLabel setText:content];
    [myLabel loadHTMLString:content baseURL:nil];
    
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
    if([self isViewLoaded] && self.view.window){
    }
}

@end
