//
//  WDTranslateViewController.m
//  TranslateTool
//
//  Created by wang on 12-11-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import "WDTranslateViewController.h"
#import "WDParseOperation.h"
#import <QuartzCore/QuartzCore.h>

@interface WDTranslateViewController ()

@end

@implementation WDTranslateViewController

@synthesize translateResult;
@synthesize translateInput;
@synthesize segmentedControl1;
@synthesize segmentedControl2;
@synthesize wordDic;
@synthesize originWord;
@synthesize translatedWord;
@synthesize originLanguage;
@synthesize destinationLanguage;
@synthesize parser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //display a board for UITextView.
    self.translateInput.backgroundColor = [UIColor clearColor];
    self.translateInput.layer.masksToBounds = YES;
    self.translateInput.layer.borderWidth = 1;
    self.translateInput.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.translateInput.delegate = self;
    
    if(self.translateInput.inputAccessoryView == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"InputToolbar" owner:self options:nil];
        self.translateInput.inputAccessoryView = self.inputToolbar;
    }
    
    self.segmentedControl1.selectedSegmentIndex = 0;
    self.segmentedControl2.selectedSegmentIndex = 1;
    //[self.segmentedControl2 setEnabled:NO forSegmentAtIndex:0];
}

- (void)endEditToTranslate:(id)sender
{
    [self.translateInput resignFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    //[textView resignFirstResponder];
    if (self.translateInput.text != NULL) {
        self.originWord = self.translateInput.text;
        NSLog(@"the origin word is : %@",self.originWord);
    }
    //invoke parse method
    [self parseJSONData];
   
}

- (IBAction)backgroundTapped:(id)sender
{
    if([self.translateInput isFirstResponder])
    {
        [self.translateInput resignFirstResponder];
        if (self.translateInput.text != NULL) {
            self.originWord = self.translateInput.text;
            NSLog(@"the origin word is : %@",self.originWord);
            //invoke parse method
            [self parseJSONData];
        }
    }
}

- (IBAction)toggleSegmentedControl1:(UISegmentedControl *)segmentControl1
{
    if (segmentedControl1.selectedSegmentIndex == 1) {
        self.segmentedControl2.selectedSegmentIndex = 0;
    }else if(segmentedControl1.selectedSegmentIndex == 2) {
        self.segmentedControl2.selectedSegmentIndex = 0;
    }else if (segmentedControl1.selectedSegmentIndex == 0) {
        self.segmentedControl2.selectedSegmentIndex = 1;
    }
}

- (void)parseJSONData
{
    switch (segmentedControl1.selectedSegmentIndex) {
        case 0:
            self.originLanguage = @"zh";
            break;
        case 1:
            self.originLanguage = @"en";
            break;
        case 2:
            self.originLanguage = @"jp";
            break;
    }
    switch (segmentedControl2.selectedSegmentIndex) {
        case 0:
            self.destinationLanguage = @"zh";
            break;
        case 1:
            self.destinationLanguage = @"en";
            break;
        case 2:
            self.destinationLanguage = @"jp";
            break;
    }
    if (self.parser == nil) {
        self.parser = [[WDParseOperation alloc] init];
    }
    [parser parse:originWord from:originLanguage to:destinationLanguage];
    /*id result = [[parser.jsonObjects valueForKey:@"trans_result"] valueForKey:@"dst"];
    NSString * resul= result;
    NSLog(@"It's a string:%@",resul);
    if ([result isKindOfClass:[NSString class]]) {
        NSLog(@"It's a string:%@",result);
    }*/
    /*self.translateResult.text = (NSString *)[[parser.jsonObjects valueForKey:@"trans_result"] valueForKey:@"dst"];*/
    NSString * result = [[[parser.jsonObjects valueForKey:@"trans_result"] objectAtIndex:0] valueForKey:@"dst"];
    NSLog(@"%@",result);
    self.translateResult.text = result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
