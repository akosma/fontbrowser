//
//  FontDetailController.h
//  FontBrowser
//
//  Created by Adrian on 11/12/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontDetailController : UIViewController <UITextViewDelegate>
{
@private
    IBOutlet UISlider *slider;
    IBOutlet UILabel *sizeLabel;
    IBOutlet UITextView *sampleView;
    UIBarButtonItem *button;
    NSString *fontName;
}

@property (nonatomic, copy) NSString *fontName;

- (IBAction)sliderValueChanged:(id)sender;

@end
