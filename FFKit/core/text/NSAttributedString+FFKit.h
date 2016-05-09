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
#include <CoreGraphics/CGGeometry.h>

@interface NSAttributedString (FFKit)

/** Returns an NSAttributedString object initialized with the characters of a 
    given string and no attribute information.
 
    @see NSAttributedString#initWithString:
*/
+ (instancetype) stringWithString: (NSString*) str;

/** Returns an NSAttributedString object initialized with a given string and 
    attributes.
 
    @see NSAttributedString#initWithString:attributes:
*/
+ (instancetype) stringWithString: (NSString*) str attributes: (NSDictionary*) attrs;

/** Returns an NSAttributedString object initialized with the characters and 
    attributes of another given attributed string.
 
    @see NSAttributedString#initWithAttributedString:
*/
+ (instancetype) stringWithAttributedString: (NSAttributedString*) attrStr;

/** Calculates and returns the bounding rect for the receiver's text drawn 
    using NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading 
    options and display characteristics, within the specified size in the 
    current graphics context.
 
    @see NSString#boundingRectWithSize:options:attributes:context:
*/
- (CGRect) boundingRectWithSize: (CGSize) size;

@end
