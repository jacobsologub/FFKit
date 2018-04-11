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

typedef void (^UIImageDrawRectBlock) (CGRect rect, CGContextRef ctx);

@interface UIImage (FFKit)

/** Returns a blank clear image with a specified size.
    
    @see imageWithSize:color, imageWithSize:color:block
*/
+ (UIImage*) imageWithSize: (CGSize) size;

/** Returns an image with a specified size and color.
 
    @see imageWithSize:, imageWithSize:color:block
*/
+ (UIImage*) imageWithSize: (CGSize) size color: (UIColor*) color;

/** Returns an image with a specified size and a block to draw the image.
 
    @see imageWithSize:, imageWithSize:color:block
    
    e.g.
    @code
 
    // Draw a gray 20x20 pixel image with a red circle.
 
    UIImage* image = [UIImage imageWithSize: CGSizeMake (20.0f, 20.0f) block: ^(CGRect rect, CGContextRef ctx) {
        CGContextSetFillColorWithColor (ctx, [UIColor whiteColor].CGColor);
        CGContextFillRect (ctx, rect);
        
        CGContextSetFillColorWithColor (ctx, [UIColor grayColor].CGColor);
        CGContextFillEllipseInRect (ctx, rect);
    }];
 
    @endcode
*/
+ (UIImage*) imageWithSize: (CGSize) size block: (UIImageDrawRectBlock) block;

/** Creates an image using the data contained within a subregion of this image.
 
    @see CGImageCreateWithImageInRect
*/
- (UIImage*) imageInRect: (CGRect) rect;

#if __IPHONE_8_0
/** Returns the image object associated with the specified filename and the 
    specified rendering mode.
*/
+ (UIImage*) imageNamed: (NSString*) name renderingMode: (UIImageRenderingMode) renderingMode;
#endif

@end
