//
//  NSString+FirstLetters.m
//  FontBrowser
//
//  Created by Adrian on 11/12/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import "NSString+FirstLetters.h"

@implementation NSString (FirstLetter)

- (NSString *)firstLetters
{
    return [self substringToIndex:2];
}

@end
