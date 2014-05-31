//
//  NSMutableAttributedString+FFKit.m
//  FFKit
//
//  Created by Jacob Sologub on 5/30/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import "NSMutableAttributedString+FFKit.h"

@implementation NSMutableAttributedString (FFKit)

- (void) setFont: (UIFont*) font {
    [self setFont: font range: NSMakeRange (0, [self length])];
}

- (void) setFont: (UIFont*) font range: (NSRange) range {
    [self addAttribute: NSFontAttributeName value: font range: NSMakeRange (0, [self length])];
}

- (void) setTextColor: (UIColor*) color {
    [self setTextColor: color range: NSMakeRange (0, [self length])];
}

- (void) setTextColor: (UIColor*) color range: (NSRange) range {
    [self addAttribute: NSForegroundColorAttributeName value: color range: range];
}

- (void) setParagraphStyle: (NSParagraphStyle*) style {
    [self setParagraphStyle: style range: NSMakeRange (0, [self length])];
}

- (void) setParagraphStyle: (NSParagraphStyle*) style range: (NSRange) range {
    [self addAttribute: NSParagraphStyleAttributeName value: style range: range];
}

@end
