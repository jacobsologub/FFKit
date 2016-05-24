/*
  ==============================================================================
 
   Copyright (C) 2016 Jacob Sologub

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

#import "UIViewController+FFKit.h"
#import <objc/runtime.h>
#import "macros.h"

#if __has_include ("../../../../FFKitConfig.h")
 #include "../../../../FFKitConfig.h"
#endif

#ifdef FFKIT_USE_ASPECTS

static inline NSValue* NSBLockValue (id block) {
    return [NSValue valueWithNonretainedObject: block];
}

static char kFFKitBlockListKey;

#endif

@implementation UIViewController (FFKit)

#ifdef FFKIT_USE_ASPECTS

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

- (void) setViewWillAppearBlock: (void (^) (BOOL animated)) block {
    assert (block != nil);
    
    [self hookSelectorChecked: @selector (viewWillAppear:) block: block aspectBlock: ^(id<AspectInfo> aspectInfo, BOOL animated) {
        block (animated);
    } error: NULL];
}

- (void) setViewDidAppearBlock: (void (^) (BOOL animated)) block {
    assert (block != nil);
    
    [self hookSelectorChecked: @selector (viewDidAppear:) block: block aspectBlock: ^(id<AspectInfo> aspectInfo, BOOL animated) {
        block (animated);
    } error: NULL];
}

- (void) setViewWillDisappearBlock: (void (^) (BOOL animated)) block {
    assert (block != nil);
    
    [self hookSelectorChecked: @selector (viewWillDisappear:) block: block aspectBlock: ^(id<AspectInfo> aspectInfo, BOOL animated) {
        block (animated);
    } error: NULL];
}

- (void) setViewDidDisappearBlock: (void (^) (BOOL animated)) block {
    assert (block != nil);
    
    [self hookSelectorChecked: @selector (viewDidDisappear:) block: block aspectBlock: ^(id<AspectInfo> aspectInfo, BOOL animated) {
        block (animated);
    } error: NULL];
}

#endif

- (UIViewController*) childViewControllerOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively {
    if ([self isKindOfClass: classType]) {
        return self;
    }
    
    for (UIViewController* viewController in self.childViewControllers) {
        if ([viewController isKindOfClass: classType]) {
            return viewController;
        }
        else {
            if (searchRecursively) {
                return [viewController childViewControllerOfClassType: classType searchRecursively: searchRecursively];
            }
        }
    }
    
    return nil;
}

- (UIViewController*) childViewControllerOfClassType: (Class) classType {
    return [self childViewControllerOfClassType: classType searchRecursively: NO];
}

@end
