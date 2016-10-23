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

#import "CALayer+FFKit.h"
#import "CGRect+FFKit.h"

const CAShadow CAShadowZero = { 0.0f, 0.0f, { 0.0f, 0.0f },  NULL, NULL};

@implementation CALayer (FFKit)

- (CAShadow) shadow {
	return CAShadowMake (self.shadowOpacity, self.shadowRadius, self.shadowOffset, self.shadowColor, self.shadowPath);
}

- (void) setShadow: (CAShadow) newShadow {
	self.shadowOpacity = newShadow.shadowOpacity;
	self.shadowRadius = newShadow.shadowRadius;
	self.shadowOffset = newShadow.shadowOffset;
	self.shadowColor = newShadow.shadowColor;
    self.shadowPath = newShadow.shadowPath;
}

- (CGFloat) x {
    return self.frame.origin.x;
}

- (void) setX: (CGFloat) newX {
    [self setX: newX adjustingWidth: NO];
}

- (void) setX: (CGFloat) newX adjustingWidth: (BOOL) adjustWidth {
    if (adjustWidth) {
        const CGFloat w = MAX (self.x + self.width - newX, 0.0f);
        self.frame = CGRectMake (newX, self.y, w, self.height);
    }
    else  {
        self.frame = CGRectSetX (self.frame, newX);
    }
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (void) setY: (CGFloat) newY {
    [self setY: newY adjustingHeight: NO];
}

- (void) setY: (CGFloat) newY adjustingHeight: (BOOL) adjustHeight {
    if (adjustHeight) {
        const CGFloat h = MAX (self.y + self.height - newY, 0.0f);
        self.frame = CGRectMake (self.x, newY, self.width, h);
    }
    else  {
        self.frame = CGRectSetY (self.frame, newY);
    }
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newWidth {
    self.frame = CGRectSetWidth (self.frame, newWidth);
}

- (CGFloat) height {
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newHeight {
    self.frame = CGRectSetHeight (self.frame, newHeight);
}

- (CGSize) size {
    return self.bounds.size;
}

- (void) setSize: (CGSize) size {
    self.frame = CGRectSetSize (self.frame, size);
}

- (CGFloat) right {
    return self.frame.origin.x + self.width;
}

- (void) setRight: (CGFloat) newRight {
    [self setRight: newRight adjustingWidth: NO];
}

- (void) setRight: (CGFloat) newRight adjustingWidth: (BOOL) adjustWidth {
    if (adjustWidth) {
        const CGFloat x = MIN (self.x, newRight);
        const CGFloat w = newRight - x;
        self.frame = CGRectMake (x, self.y, w, self.height);
    }
    else {
        const CGFloat x = newRight - self.width;
        self.frame = CGRectSetX (self.frame, x);
    }
}

- (CGFloat) bottom {
    return self.frame.origin.y + self.height;
}

- (void) setBottom: (CGFloat) newBottom {
    [self setBottom: newBottom adjustingHeight: NO];
}

- (void) setBottom: (CGFloat) newBottom adjustingHeight: (BOOL) adjustHeight {
    if (adjustHeight) {
        const CGFloat y = MIN (self.y, newBottom);
        const CGFloat h = newBottom - y;
        self.frame = CGRectMake (self.x, y, self.width, h);
    }
    else {
        const CGFloat y = newBottom - self.height;
        self.frame = CGRectSetY (self.frame, y);
    }
}

- (void) centerWithSize: (CGSize) newSize {
    [self centerWithSize: newSize block: nil];
}

- (void) centerWithSize: (CGSize) newSize block: (void (^) (CGRect* frame)) block {
    const CGSize parentSize = self.superlayer.bounds.size;
    
    const CGFloat xpos = roundf ((parentSize.width - newSize.width) * 0.5f);
    const CGFloat ypos = roundf ((parentSize.height - newSize.height) * 0.5f);
    
    CGRect frame = CGRectMake (xpos, ypos, newSize.width, newSize.height);
    if (block != nil) {
        block (&frame);
    }
    
    self.frame = frame;
}

- (BOOL) visible {
    return !self.hidden;
}

- (void) setVisible: (BOOL) shouldBeVisible {
    self.hidden = !shouldBeVisible;
}

- (CALayer*) sublayerOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively {
    if ([self isKindOfClass: classType]) {
        return self;
    }
    
    for (CALayer* layer in self.sublayers) {
        if ([layer isKindOfClass: classType]) {
            return layer;
        }
        else {
            if (searchRecursively) {
                return [layer sublayerOfClassType: classType searchRecursively: searchRecursively];
            }
        }
    }
    
    return nil;
}

- (CALayer*) sublayerOfClassType: (Class) classType {
    return [self sublayerOfClassType: classType searchRecursively: NO];
}

+ (void) performWithDisabledActions: (void (^) (void)) disabledActions {
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    {
        disabledActions();
    }
    [CATransaction commit];
}
@end
