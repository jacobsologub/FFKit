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
#import "CGRect+FFKit.h"
#include "../../events/FFListenerList.h"
#import <objc/runtime.h>

#if __has_include ("../../../../FFKitConfig.h")
 #include "../../../../FFKitConfig.h"
#endif

#ifdef FFKIT_USE_ASPECTS
 static char kUIViewResizedKey;

 static inline NSValue* NSBLockValue (id block) {
     return [NSValue valueWithNonretainedObject: block];
 }

 static char kFFKitBlockListKey;

#endif

@implementation UIView (FFKit)

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
    return self.bounds.size.width;
}

- (void) setWidth: (CGFloat) newWidth {
    self.frame = CGRectSetWidth (self.frame, newWidth);
}

- (CGFloat) height {
    return self.bounds.size.height;
}

- (void) setHeight: (CGFloat) newHeight {
    self.frame = CGRectSetHeight (self.frame, newHeight);
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
    const CGSize parentSize = self.superview.bounds.size;
    
    const CGFloat xpos = roundf ((parentSize.width - newSize.width) * 0.5f);
    const CGFloat ypos = roundf ((parentSize.height - newSize.height) * 0.5f);
    
    CGRect frame = CGRectMake (xpos, ypos, newSize.width, newSize.height);
    if (block != nil) {
        block (&frame);
    }
    
    self.frame = frame;
}

- (CGFloat) centerX {
    return self.center.x;
}

- (void) setCenterX: (CGFloat) newCenterX {
    self.center = CGPointMake (newCenterX, self.centerY);
}

- (CGFloat) centerY {
    return self.center.y;
}

- (void) setCenterY: (CGFloat) newCenterY {
    self.center = CGPointMake (self.centerX, newCenterY);
}

- (BOOL) visible {
    return !self.hidden;
}

- (void) setVisible: (BOOL) shouldBeVisible {
    self.hidden = !shouldBeVisible;
}

- (BOOL) isShowing {
    return (self.window != nil) && self.visible && (self.alpha > 0.0f);
}

#ifdef FFKIT_USE_ASPECTS

- (FFListenerList*) resized {
    FFListenerList* _resized = objc_getAssociatedObject (self, &kUIViewResizedKey);
    
    if (_resized == nil) {
        _resized = [FFListenerList new];
        objc_setAssociatedObject (self, &kUIViewResizedKey, _resized, OBJC_ASSOCIATION_RETAIN);
        
        [self aspect_hookSelector: @selector (layoutSubviews) withOptions: AspectPositionAfter usingBlock: ^(id<AspectInfo> aspectInfo) {
            UIView* _view = (UIView*) [aspectInfo instance];
            [_view.resized callWithObject: _view withObject: [NSValue valueWithCGSize: _view.bounds.size]];
        } error: NULL];
    }
    
    return _resized;
}

- (NSMutableArray*) blockList {
    NSMutableArray* _list = objc_getAssociatedObject (self, &kFFKitBlockListKey);
    if (_list == nil) {
        _list = [NSMutableArray new];
        objc_setAssociatedObject (self, &kFFKitBlockListKey, _list, OBJC_ASSOCIATION_RETAIN);
    }
    
    return _list;
}

- (id<AspectToken>) hookSelectorChecked: (SEL) selector block: (id) block aspectBlock: (id) aspectBlock error: (NSError**) error {
    NSMutableArray* const list = [self blockList];
    if (![list containsObject: NSBLockValue (block)]) {
        [list addObject: NSBLockValue (block)];
        
        return [self aspect_hookSelector: selector withOptions: AspectPositionAfter usingBlock: aspectBlock error: error];
    }
    
    return nil;
}

- (void) setLayoutSubviewsBlock: (void (^) (void)) block {
    assert (block != nil);
    
    [self hookSelectorChecked: @selector (layoutSubviews) block: block aspectBlock: ^(id<AspectInfo> aspectInfo) {
        block();
    } error: NULL];
}

#endif

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

- (UIViewController*) viewController {
    UIViewController* nextResponder = (UIViewController*) [self nextResponder];
    if ([nextResponder isKindOfClass: [UIViewController class]] && nextResponder.view == self) {
        return nextResponder;
    }
    else {
        return nil;
    }
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

+ (void) animateWithDuration: (NSTimeInterval) duration usingSpringWithDamping: (CGFloat) dampingRatio animations: (void (^)(void)) animations completion: (void (^)(BOOL finished)) completion {
    [UIView animateWithDuration: duration delay: 0.0f usingSpringWithDamping: dampingRatio initialSpringVelocity: 1.0f options: UIViewAnimationOptionCurveEaseInOut animations: animations completion: completion];
}

+ (void) animateWithDuration: (NSTimeInterval) duration delay: (double) delay usingSpringWithDamping: (CGFloat) dampingRatio animations: (void (^)(void)) animations completion: (void (^)(BOOL finished)) completion {
    [UIView animateWithDuration: duration delay: delay usingSpringWithDamping: dampingRatio initialSpringVelocity: 1.0f options: UIViewAnimationOptionCurveEaseInOut animations: animations completion: completion];
}

+ (void) animateWithDuration: (NSTimeInterval) duration options: (UIViewAnimationOptions) options animations: (void (^)(void)) animations completion: (void (^ __nullable)(BOOL finished)) completion {
    [UIView animateWithDuration: duration delay: 0.0 options: options animations: animations completion: completion];
}

+ (void) animateWithDuration: (NSTimeInterval) duration options: (UIViewAnimationOptions) options animations: (void (^)(void)) animations {
    [UIView animateWithDuration: duration options: options animations: animations completion: nil];
}

@end
