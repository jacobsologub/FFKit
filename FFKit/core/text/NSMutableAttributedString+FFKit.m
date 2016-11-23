/*
  ==============================================================================
 
   Copyright (C) 2014 Jacob Sologub

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to
   deal in the Software without restriction, including without limitation the
   rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
   sell copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
   IN THE SOFTWARE.
 
  ==============================================================================
*/

#import "NSMutableAttributedString+FFKit.h"

@implementation NSMutableAttributedString (FFKit)

+ (instancetype) stringWithString: (NSString*) str {
    return [[NSMutableAttributedString alloc] initWithString: str];
}

+ (instancetype) stringWithString: (NSString*) str attributes: (NSDictionary*) attrs {
    return [[NSMutableAttributedString alloc] initWithString: str attributes: attrs];
}

+ (instancetype) stringWithAttributedString: (NSAttributedString*) attrStr {
    return [[NSMutableAttributedString alloc] initWithAttributedString: attrStr];
}

- (void) setFont: (UIFont*) font {
    [self setFont: font range: NSMakeRange (0, [self length])];
}

- (void) setFont: (UIFont*) font range: (NSRange) range {
    [self addAttribute: NSFontAttributeName value: font range: range];
}

- (void) setTextColor: (UIColor*) color {
    [self setTextColor: color range: NSMakeRange (0, [self length])];
}

- (void) setTextColor: (UIColor*) color range: (NSRange) range {
    [self addAttribute: NSForegroundColorAttributeName value: color range: range];
}

- (void) setKerning: (CGFloat) kerning {
    [self setKerning: kerning range: NSMakeRange (0, [self length])];
}

- (void) setKerning: (CGFloat) kerning range: (NSRange) range {
    [self addAttribute: NSKernAttributeName value: @(kerning) range: range];
}

- (void) setParagraphStyle: (NSParagraphStyle*) style {
    [self setParagraphStyle: style range: NSMakeRange (0, [self length])];
}

- (void) setParagraphStyle: (NSParagraphStyle*) style range: (NSRange) range {
    [self addAttribute: NSParagraphStyleAttributeName value: style range: range];
}

@end
