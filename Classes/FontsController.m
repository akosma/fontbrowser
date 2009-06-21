//
//  FontsController.m
//  FontTests
//
//  Created by Adrian on 11/12/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import "FontsController.h"
#import "FontDetailController.h"
#import "NSString+FirstLetters.h"

@implementation FontsController

@synthesize controller;

- (id)init
{
    if (self = [super initWithStyle:UITableViewStylePlain])
    {
        familyNames = [[[UIFont familyNames] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] retain];
        controller = [[UINavigationController alloc] initWithRootViewController:self];
        detailController = [[FontDetailController alloc] init];
        self.tableView.rowHeight = 50;
        self.title = @"Font Browser";
    }
    return self;
}

- (void)dealloc
{
    [controller release];
    [familyNames release];
    [detailController release];
    [super dealloc];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [familyNames count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    return [familyNames valueForKey:@"firstLetters"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    NSArray *fontNames = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:section]];
    return [fontNames count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    return [familyNames objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSArray *fontNames = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indexPath.section]];
    static NSString *identifier = @"iPhoneFontBrowser";
    NSString *font = [fontNames objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) 
    {
        CGRect rect = CGRectMake(0.0, 0.0, 320.0, 50.0);
        cell = [[[UITableViewCell alloc] initWithFrame:rect reuseIdentifier:identifier] autorelease];
    }
    cell.font = [UIFont fontWithName:font size:18.0];
    cell.text =  font;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSArray *fontNames = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indexPath.section]];
    NSString *identifier = [fontNames objectAtIndex:indexPath.row];
    detailController.fontName = identifier;
    detailController.title = identifier;
    [self.controller pushViewController:detailController animated:YES];
}

@end
