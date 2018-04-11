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

#pragma once

#import <UIKit/UIKit.h>

#if defined (__cplusplus)
 #include <tuple>

 namespace ffkit {
     using UIColorRGBA = std::tuple <CGFloat, CGFloat, CGFloat, CGFloat>;
 }

 using ffkit::UIColorRGBA;
#endif

@interface UIColor (FFKit)

/**	Creates and returns a color object using the specified 'ARGB" hex value. */
+ (UIColor*) colorWithARGBHex: (UInt32) hex;

/**	Creates and returns a color object using the specified 'RGB" hex value. */
+ (UIColor*) colorWithRGBHex: (UInt32) hex;

/**	Returns a 32-bit integer 'ARGB' hex value using the specified UIColor value. */
+ (UInt32) ARGBHexWithColor: (UIColor*) color;

/**	Returns a 32-bit integer 'ARGB' hex value for this color. */
- (UInt32) ARGBHex;

/** Returns a Boolean value that indicates whether this color and a given color 
    are equal.
*/
- (BOOL) isEqualToColor: (UIColor*) color;

/** Creates and returns a color object that has the same color space and 
    component values as the receiver, but has the specified alpha component.
*/
- (UIColor*) colorWithAlpha: (CGFloat) alpha;

/** Creates and returns a color object using the specified image filename. */
+ (UIColor*) colorWithPatternImageNamed: (NSString*) name;

#if defined (__cplusplus)
/** Returns the components that make up the color in the RGB color space.
    @see ffkit::UIColorRGBA, std::tuple
*/
@property (nonatomic, readonly) UIColorRGBA rgba;
#endif

@end
