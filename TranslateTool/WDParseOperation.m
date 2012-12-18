//
//  WDParseOperation.m
//  TranslateTool
//
//  Created by wang on 12-12-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import "WDParseOperation.h"

@implementation WDParseOperation

@synthesize jsonObjects;

-(void)parse:(NSString *)originWord from:(NSString *)language1 to:(NSString *)languagle2
{
    if (language1 == nil || languagle2 == nil) {
        language1=languagle2=@"auto";
    }
    NSLog(@"parse...");
    NSString * urlString = [NSString stringWithFormat:@"http://openapi.baidu.com/public/2.0/bmt/translate?client_id=y6Xz8rnEj3q5GpLyEUl3YYQS&q=%@&from=%@&to=%@",originWord,language1,languagle2];
    NSURL * url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsonData = [NSData dataWithContentsOfURL:url];
    
    NSError * error = nil;
    
    id objects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if ([objects isKindOfClass:[NSDictionary class]] && error == nil) {
        //NSLog(@"it's dic");
        self.jsonObjects = (NSMutableDictionary *)objects;
        //id object = [[self.jsonObjects valueForKey:@"trans_result"] valueForKey:@"dst"];
        //NSLog(@"JSON 对象objects:%@",[[self.jsonObjects valueForKey:@"trans_result"] valueForKey:@"dst"]);
        NSLog(@"JSON :%@",self.jsonObjects);
        //if ([[self.jsonObjects valueForKey:@"trans_result"] isKindOfClass:[NSArray class]]) {
        //    NSLog(@"it's dic");
        //}
        //NSString * result = [[[self.jsonObjects valueForKey:@"trans_result"] objectAtIndex:0] valueForKey:@"dst"];
        //NSLog(@"dst:%@",result);
       // NSLog(@"result:%@",[[self.jsonObjects valueForKey:@"trans_result"] objectAtIndex:0]);
        
    }
    if(error)
    {
        NSLog(@"error:%@",error);
    }
    
    
}

@end
