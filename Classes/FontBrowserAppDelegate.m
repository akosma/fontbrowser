//
//  FontBrowserAppDelegate.m
//  FontBrowser
//
//  Created by Adrian on 11/12/08.
//  Copyright Adrian Kosmaczewski 2008. All rights reserved.
//

#import "FontBrowserAppDelegate.h"
#import "FontsController.h"

@implementation FontBrowserAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    viewController = [[FontsController alloc] init];
    [window addSubview:viewController.controller.view];
    [window makeKeyAndVisible];
}

- (void)dealloc 
{
    [viewController release];
    [window release];
    [super dealloc];
}

@end
