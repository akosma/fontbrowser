//
//  FontDetailController.m
//  FontBrowser
//
//  Created by Adrian on 11/12/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import "FontDetailController.h"

@interface FontDetailController (Private)
- (void)done:(id)sender;
- (void)clear:(id)sender;
@end

@implementation FontDetailController

@synthesize fontName;

- (id)init
{
    if (self = [super initWithNibName:@"FontDetail" bundle:nil]) 
    {
        button = [[UIBarButtonItem alloc] initWithTitle:@"Clear"
                                                  style:UIBarButtonItemStylePlain
                                                 target:self 
                                                 action:@selector(clear:)];
        self.navigationItem.rightBarButtonItem = button;
    }
    return self;
}

- (void)dealloc
{
    [button release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    sampleView.font = [UIFont fontWithName:self.fontName size:slider.value];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self done:self];
}

- (IBAction)sliderValueChanged:(id)sender
{
    sizeLabel.text = [NSString stringWithFormat:@"%1.0f pt", slider.value];
    sampleView.font = [UIFont fontWithName:self.fontName size:slider.value];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    button.title = @"Done";
    button.action = @selector(done:);
    button.style = UIBarButtonItemStyleDone;
    sampleView.frame = CGRectMake(0.0, 50.0, 320.0, 150.0);
    return TRUE;
}

- (void)done:(id)sender
{
    button.title = @"Clear";
    button.action = @selector(clear:);
    button.style = UIBarButtonItemStylePlain;
    sampleView.frame = CGRectMake(0.0, 50.0, 320.0, 430.0);
    [sampleView resignFirstResponder];
}

- (void)clear:(id)sender
{
    sampleView.text = @"";
    [sampleView becomeFirstResponder];
}

@end
