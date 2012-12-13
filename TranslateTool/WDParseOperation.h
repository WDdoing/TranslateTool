//
//  WDParseOperation.h
//  TranslateTool
//
//  Created by wang on 12-12-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDParseOperation : NSObject


@property (strong, nonatomic)NSMutableDictionary * jsonObjects;

- (void)parse:(NSString *) originWord from:(NSString *) language1 to:(NSString *) languagle2;

@end
