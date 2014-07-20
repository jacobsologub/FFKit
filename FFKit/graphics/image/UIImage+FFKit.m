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

#import "UIImage+FFKit.h"

@implementation UIImage (FFKit)

+ (UIImage*) imageWithSize: (CGSize) size {
    return [self imageWithSize: size color: [UIColor clearColor]];
}

+ (UIImage*) imageWithSize: (CGSize) size color: (UIColor*) color {
    UIImage* result = nil;
    
	UIGraphicsBeginImageContextWithOptions (size, NO, [UIScreen mainScreen].scale); {
        CGContextRef g = UIGraphicsGetCurrentContext();
        [color setFill];
        CGContextFillRect (g, CGRectMake (0.0f, 0.0f, size.width, size.height));
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
	UIGraphicsEndImageContext();
    
	return result;
}

+ (UIImage*) imageWithSize: (CGSize) size block: (UIImageDrawRectBlock) block {
    UIImage* result = nil;
    
    UIGraphicsBeginImageContextWithOptions (size, NO, [[UIScreen mainScreen] scale]); {
        CGContextRef g = UIGraphicsGetCurrentContext();
        if (block != nil) {
            block (CGRectMake (0.0f, 0.0f, size.width, size.height), g);
        }
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
	UIGraphicsEndImageContext();
	
	return result;
}

- (UIImage*) imageInRect: (CGRect) rect {
    CGImageRef newImageRef = CGImageCreateWithImageInRect (self.CGImage, rect);
    
    UIImage* newImage = [UIImage imageWithCGImage: newImageRef];
    CGImageRelease (newImageRef);
    
    return newImage;
}

@end
