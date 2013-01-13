//
//  WDTranslateViewController.h
//  TranslateTool
//
//  Created by wang on 12-11-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDParseOperation;

@interface WDTranslateViewController : UIViewController<UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel * translateResult;
@property (strong, nonatomic) IBOutlet UITextView * translateInput;
@property (strong, nonatomic) IBOutlet UISegmentedControl * segmentedControl1;
@property (strong, nonatomic) IBOutlet UISegmentedControl * segmentedControl2;
@property (strong, nonatomic) IBOutlet UIToolbar * inputToolbar;
@property (strong, nonatomic) NSDictionary * wordDic;
@property (strong, nonatomic) NSString * originWord;
@property (strong, nonatomic) NSString * translatedWord;
@property (strong, nonatomic) NSString * originLanguage;
@property (strong, nonatomic) NSString * destinationLanguage;
@property (strong, nonatomic) WDParseOperation * parser;


- (IBAction)toggleSegmentedControl1:(UISegmentedControl *)segmentControl1;

- (void)textViewDidEndEditing:(UITextView *)textView;

- (IBAction)backgroundTapped:(id)sender;
- (IBAction)endEditToTranslate:(id)sender;


@end
