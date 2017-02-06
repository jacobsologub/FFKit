/*
  ==============================================================================
 
   Copyright (C) 2017 Jacob Sologub

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

#import "CARadialGradientLayer.h"
#import <UIKit/UIColor.h>
#import <vector>

using std::vector;

@implementation CARadialGradientLayer
@synthesize colors;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    if ((self = [super init]) != nil) {
        [self setNeedsDisplay];
    }
    
    return self;
}

- (void) dealloc {
    
}

#pragma mark -
#pragma mark UIView Overrides
//==============================================================================
- (void) drawInContext: (CGContextRef) ctx {
    [super drawInContext: ctx];
    
    if (colors.count > 1) {
        vector<CGFloat> _colors;
        
        float location = 0.0f;
        vector<CGFloat> _locations;
        
        for (id c in colors) {
            UIColor* const color = [UIColor colorWithCGColor: (CGColorRef) c];
            
            CGFloat r = 0.0f, g = 0.0f, b = 0.0f, a = 0.0f;
            [color getRed: &r green: &g blue: &b alpha: &a];
            
            _colors.push_back (r);
            _colors.push_back (g);
            _colors.push_back (b);
            _colors.push_back (a);
            
            _locations.push_back (location);
            location += (1.0f / ((float) colors.count - 1.0f));
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef const gradient = CGGradientCreateWithColorComponents (colorSpace, &_colors [0], &_locations [0], (size_t) _locations.size());
        CGColorSpaceRelease (colorSpace);
        
        const CGPoint center = CGPointMake (self.bounds.size.width / 2.0f, self.bounds.size.height / 2.0f);
        const float radius = MIN (self.bounds.size.width , self.bounds.size.height);
        
        CGContextDrawRadialGradient (ctx, gradient, center, 0.0f, center, radius, kCGGradientDrawsAfterEndLocation);
    }
}

#pragma mark -
#pragma mark Colors
//==============================================================================
- (void) setColors: (NSArray*) newColors {
    colors = [newColors copy];
    [self setNeedsDisplay];
}

@end
