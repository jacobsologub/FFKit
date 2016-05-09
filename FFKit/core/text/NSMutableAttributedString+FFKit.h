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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (FFKit)

/** Returns an NSMutableAttributedString object initialized with the characters 
    of a given string and no attribute information.
 
    @see NSMutableAttributedString#initWithString:
*/
+ (instancetype) stringWithString: (NSString*) str;

/** Returns an NSMutableAttributedString object initialized with a given string 
    and attributes.
 
    @see NSMutableAttributedString#initWithString:attributes:
*/
+ (instancetype) stringWithString: (NSString*) str attributes: (NSDictionary*) attrs;

/** Returns an NSMutableAttributedString object initialized with the characters 
    and attributes of another given attributed string.
 
    @see NSMutableAttributedString#initWithAttributedString:
*/
+ (instancetype) stringWithAttributedString: (NSAttributedString*) attrStr;

/** Sets the NSFontAttributeName attribute for all the characters.
 
    @see NSMutableAttributedString#setFont:range
*/
- (void) setFont: (UIFont*) font;

/** Sets the NSFontAttributeName attribute for the characters in the specified 
    range.
    
    @see NSMutableAttributedString#setFont
*/
- (void) setFont: (UIFont*) font range: (NSRange) range;

/** Sets the NSForegroundColorAttributeName attribute for all the characters.
    
    @see NSMutableAttributedString#setTextColor:range
*/
- (void) setTextColor: (UIColor*) color;

/** Sets the NSForegroundColorAttributeName attribute for the characters in the 
    specified range.

    @see NSMutableAttributedString#setTextColor
*/
- (void) setTextColor: (UIColor*) color range: (NSRange) range;

/** Sets the NSKernAttributeName attribute for all the characters.
    
    @see NSMutableAttributedString#setTextColor:range
*/
- (void) setKerning: (CGFloat) kerning;

/** Sets the NSKernAttributeName attribute for the characters in the
    specified range.

    @see NSMutableAttributedString#setKern
*/
- (void) setKerning: (CGFloat) kerning range: (NSRange) range;

/** Sets the NSParagraphStyleAttributeName attribute for all the characters.
    
    @see NSMutableAttributedString#setParagraphStyle:range
*/
- (void) setParagraphStyle: (NSParagraphStyle*) style;

/** Sets the NSParagraphStyleAttributeName attribute for the characters in the 
    specified range.
 
    @see NSMutableAttributedString#setParagraphStyle
*/
- (void) setParagraphStyle: (NSParagraphStyle*) style range: (NSRange) range;

@end
