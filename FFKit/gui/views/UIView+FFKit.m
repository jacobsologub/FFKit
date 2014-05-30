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

#import "UIView+FFKit.h"

@implementation UIView (FFKit)

- (float) x {
    return self.frame.origin.x;
}

- (float) y {
    return self.frame.origin.y;
}

- (float) width {
    return self.bounds.size.width;
}

- (float) height {
    return self.bounds.size.height;
}

- (float) right {
    return self.frame.origin.x + self.width;
}

- (float) bottom {
    return self.frame.origin.y + self.height;
}

- (void) centerWithSize: (CGSize) newSize {
	const CGSize parentSize = self.superview.bounds.size;
	
	const float xpos = roundf ((parentSize.width - newSize.width) * 0.5f);
	const float ypos = roundf ((parentSize.height - newSize.height) * 0.5f);
	
	self.frame = CGRectMake (xpos, ypos, newSize.width, newSize.height);
}

- (BOOL) visible {
    return !self.hidden;
}

- (void) setVisible: (BOOL) shouldBeVisible {
    self.hidden = !shouldBeVisible;
}

- (UIView*) subviewOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively {
    if ([self isKindOfClass: classType]) {
        return self;
    }
    
    for (UIView* view in self.subviews) {
        if ([view isKindOfClass: classType]) {
            return view;
        }
        else {
            if (searchRecursively) {
                return [view subviewOfClassType: classType searchRecursively: searchRecursively];
            }
        }
    }
    
    return nil;
}

- (UIView*) subviewOfClassType: (Class) classType {
    return [self subviewOfClassType: classType searchRecursively: NO];
}

- (UIView*) superviewOfClassType: (Class) classType {
    UIView* view = self.superview;
    
    while (view != nil)
    {
        if ([view isKindOfClass: classType])
        {
            return view;
        }
        
        view = view.superview;
    }
    
    return nil;
}

- (UIView*) superviewWithTag: (NSInteger) tag {
    UIView* view = self.superview;
    
    while (view != nil) {
        if (view.tag == tag) {
            return view;
        }
        
        view = view.superview;
    }
    
    return nil;
}

- (UIImage*) snapshotImage {
    UIImage* snapshot = nil;
    
	UIGraphicsBeginImageContext (self.bounds.size); {
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        snapshot = UIGraphicsGetImageFromCurrentImageContext();
    }
	UIGraphicsEndImageContext();
	
	return snapshot;
}

- (UIImage*) snapshotImageWithOptions: (BOOL) opaque scale: (CGFloat) scale {
    UIImage* snapshot = nil;
    
	UIGraphicsBeginImageContextWithOptions (self.bounds.size, opaque, scale); {
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        snapshot = UIGraphicsGetImageFromCurrentImageContext();
    }
	UIGraphicsEndImageContext();
	
	return snapshot;
}

@end
