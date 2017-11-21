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

#import "UIColor+FFKit.h"

@implementation UIColor (FFKit)

+ (UIColor*) colorWithARGBHex: (UInt32) hex {
    const float a = ((hex >> 24) & 0xff) / 255.0f;
	const float r = ((hex >> 16) & 0xff) / 255.0f;
	const float g = ((hex >> 8) & 0xff) / 255.0f;
	const float b = ((hex) & 0xff) / 255.0f;
    
	return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

+ (UIColor*) colorWithRGBHex: (UInt32) hex {
    const float a = 1.0f;
	const float r = ((hex >> 16) & 0xff) / 255.0f;
	const float g = ((hex >> 8) & 0xff) / 255.0f;
	const float b = ((hex) & 0xff) / 255.0f;
    
	return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

+ (UInt32) ARGBHexWithColor: (UIColor*) color {
    CGFloat a = 0.0f;
    CGFloat r = 0.0f;
    CGFloat g = 0.0f;
    CGFloat b = 0.0f;
    
    [color getRed: &r green: &g blue: &b alpha: &a];
    
    return ((UInt32) (a * 255) << 24) + ((UInt32) (r * 255) << 16) + ((UInt32) (g * 255) << 8) + ((UInt32) (b * 255) << 0);
}

- (UInt32) ARGBHex {
    return [UIColor ARGBHexWithColor: self];
}

- (BOOL) isEqualToColor: (UIColor*) color {
    return [self ARGBHex] == [color ARGBHex];
}

- (UIColor*) colorWithAlpha: (CGFloat) alpha {
    return [self colorWithAlphaComponent: alpha];
}

+ (UIColor*) colorWithPatternImageNamed: (NSString*) name {
    return [UIColor colorWithPatternImage: [UIImage imageNamed: name]];
}

#if defined (__cplusplus)
- (UIColorRGBA) rgba {
    CGFloat r = 0.0f;
    CGFloat g = 0.0f;
    CGFloat b = 0.0f;
    CGFloat a = 0.0f;
    
    [self getRed: &r green: &g blue: &b alpha: &a];
    
    return std::make_tuple (r, g, b, a);
}
#endif

@end
