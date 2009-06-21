//
//  FontsController.h
//  FontTests
//
//  Created by Adrian on 11/12/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FontDetailController;

@interface FontsController : UITableViewController 
{
@private
    NSArray *familyNames;
    UINavigationController *controller;
    FontDetailController *detailController;
}

@property (nonatomic, retain) UINavigationController *controller;

@end
