//
//  WDTranslateViewController.m
//  TranslateTool
//
//  Created by wang on 12-11-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import "WDTranslateViewController.h"

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
    self.segmentedControl1.selectedSegmentIndex = 0;
    self.segmentedControl2.selectedSegmentIndex = 1;
    //[self.segmentedControl2 setEnabled:NO forSegmentAtIndex:0];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
    if (self.translateInput.text != NULL) {
        self.originWord = self.translateInput.text;
        NSLog(@"the origin word is : %@",self.originWord);
    }
    //invoke parse method
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
