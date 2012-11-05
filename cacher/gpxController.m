//
//  gpxController.m
//  cacher
//
//  Created by crinq on 17.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "gpxController.h"

@implementation gpxController


- (id)init
{
    self = [super init];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(parseGPX) userInfo:nil repeats:NO];
    return self;
}

-(void)parseGPX{
    articles = [[NSMutableArray alloc] init];
    errorParsing=NO;
    
    NSArray *documentPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *ourDocumentPath = [documentPaths objectAtIndex:0];
    
    NSString *myFile = [ourDocumentPath stringByAppendingString:@"/caches.gpx"];
    
    NSData *xmlFile = [[NSData alloc] initWithContentsOfFile:myFile];
    rssParser = [[NSXMLParser alloc] initWithData:xmlFile];
    [rssParser setDelegate:self];
    
    // You may need to turn some of these on depending on the type of XML file you are parsing
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    
    [rssParser parse];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    NSString *errorString = [NSString stringWithFormat:@"Error code %i", [parseError code]];
    NSLog(@"Error parsing XML: %@", errorString);
    
    
    errorParsing=YES;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //currentElement = [elementName copy];
    ElementValue = [[NSMutableString alloc] init];
    //NSLog(@"start: %@", elementName);
    if ([elementName isEqualToString:@"wpt"]) {
        valid = FALSE;
        name = FALSE;
        type = FALSE;
        currentCache = [[cache alloc] init];
        [currentCache setGCPos:[[pos alloc] initWithLongitudeInDeg:[[attributeDict valueForKey:@"lon"] doubleValue] andLatitudeInDeg:[[attributeDict valueForKey:@"lat"] doubleValue]]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [ElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if(currentCache != nil){
        if([elementName isEqualToString:@"name"]) {
            [currentCache setGCCode:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:name"] && !name) {
            name = TRUE;
            [currentCache setGCName:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:container"]) {
            [currentCache setGCSize:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:difficulty"]) {
            [currentCache setD:[ElementValue doubleValue]];
        }
        
        if([elementName isEqualToString:@"groundspeak:terrain"]) {
            [currentCache setT:[ElementValue doubleValue]];
        }
        
        if([elementName isEqualToString:@"groundspeak:short_description"]) {
            valid = TRUE;
            [currentCache setGCShortInfo:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:long_description"]) {
            valid = TRUE;
            [currentCache setGCInfo:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:encoded_hints"]) {
            [currentCache setGCHint:ElementValue];
        }
        
        if([elementName isEqualToString:@"groundspeak:type"] && !type){
            type = TRUE;
            [currentCache setGCType:ElementValue];
        }
        
        if([elementName isEqualToString:@"wpt"] && valid){
            [[[root get] rootControllerSwitch] addCache:currentCache];
            currentCache = nil;
        }
    }
    else{
        
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    if (errorParsing == NO)
    {
        NSLog(@"XML processing done!");
    } else {
        NSLog(@"Error occurred during XML processing");
    }
    
}

@end
