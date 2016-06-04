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

#import "NSNotificationCenter+FFKit.h"
#import <UIKit/UIWindow.h>
#import <objc/runtime.h>

#if __has_include ("../../../FFKitConfig.h")
 #include "../../../FFKitConfig.h"
#endif

#ifdef FFKIT_USE_ASPECTS

static inline NSValue* NSBLockValue (id block) {
    return [NSValue valueWithNonretainedObject: block];
}

static char kFFKitBlockListKey;

#endif

@implementation NSNotificationCenter (FFKit)

+ (void) addUIKeyboardWillShowNotificationObserver: (id) observer selector: (SEL) selector {
    [NSNotificationCenter addObserver: observer selector: selector name: UIKeyboardWillShowNotification];
}

+ (void) addUIKeyboardDidShowNotificationObserver: (id) observer selector: (SEL) selector {
    [NSNotificationCenter addObserver: observer selector: selector name: UIKeyboardDidShowNotification];
}

+ (void) addUIKeyboardWillHideNotificationObserver: (id) observer selector: (SEL) selector {
    [NSNotificationCenter addObserver: observer selector: selector name: UIKeyboardWillHideNotification];
}

+ (void) addUIKeyboardDidHideNotificationObserver: (id) observer selector: (SEL) selector {
    [NSNotificationCenter addObserver: observer selector: selector name: UIKeyboardDidHideNotification];
}

#ifdef FFKIT_USE_ASPECTS
- (NSMutableArray*) blockList {
    NSMutableArray* _list = objc_getAssociatedObject (self, &kFFKitBlockListKey);
    if (_list == nil) {
        _list = [NSMutableArray new];
        objc_setAssociatedObject (self, &kFFKitBlockListKey, _list, OBJC_ASSOCIATION_RETAIN);
    }
    
    return _list;
}

- (id<AspectToken>) hookSelectorChecked: (SEL) selector options: (AspectOptions) options block: (id) block aspectBlock: (id) aspectBlock error: (NSError**) error {
    NSMutableArray* const list = [self blockList];
    if (![list containsObject: NSBLockValue (block)]) {
        [list addObject: NSBLockValue (block)];
        
        return [self aspect_hookSelector: selector withOptions: options usingBlock: aspectBlock error: error];
    }
    
    return nil;
}

+ (void) addUIKeyboardNotificationObserver: (NSString*) notificationName block: (UIKeyboardWillShowNotificationObserverBlock) block {
    NSNotificationCenter* defaultCenter = [NSNotificationCenter defaultCenter];
    
    [defaultCenter hookSelectorChecked: @selector (postNotificationName:object:userInfo:)
        options: AspectPositionAfter block: block
        aspectBlock: ^(id<AspectInfo> aspectInfo, NSString* name, id object, NSDictionary* userInfo) {
            
            if ([name isEqualToString: notificationName]) {
                UIKeyboardNotificationInfo info = {
                    [userInfo [UIKeyboardAnimationCurveUserInfoKey] integerValue],
                    [userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue],
                    [userInfo [UIKeyboardFrameBeginUserInfoKey] CGRectValue],
                    [userInfo [UIKeyboardFrameEndUserInfoKey] CGRectValue],
                    [userInfo [UIKeyboardIsLocalUserInfoKey] boolValue]
                };
                
                block (info);
            }
        }
        error: NULL
    ];
}

+ (void) addUIKeyboardWillShowNotificationObserver: (UIKeyboardWillShowNotificationObserverBlock) block {
    [self addUIKeyboardNotificationObserver: UIKeyboardWillShowNotification block: block];
}

+ (void) addUIKeyboardDidShowNotificationObserver: (UIKeyboardWillShowNotificationObserverBlock) block {
    [self addUIKeyboardNotificationObserver: UIKeyboardDidShowNotification block: block];
}

+ (void) addUIKeyboardWillHideNotificationObserver: (UIKeyboardWillShowNotificationObserverBlock) block {
    [self addUIKeyboardNotificationObserver: UIKeyboardWillHideNotification block: block];
}

+ (void) addUIKeyboardDidHideNotificationObserver: (UIKeyboardWillShowNotificationObserverBlock) block {
    [self addUIKeyboardNotificationObserver: UIKeyboardDidHideNotification block: block];
}

#endif

+ (void) addObserver: (id) observer selector: (SEL) selector name: (nullable NSString*) name {
    [NSNotificationCenter addObserver: observer selector: selector name: name object: nil];
}

+ (void) addObserver: (id) observer selector: (SEL) selector name: (nullable NSString*) name object: (nullable id) object {
    [[NSNotificationCenter defaultCenter] addObserver: observer selector: selector name: name object: object];
}

+ (void) removeObserver: (id) observer {
    [[NSNotificationCenter defaultCenter] removeObserver: observer];
}

+ (void) removeObserver: (id) observer name: (nullable NSString*) name object: (nullable id) object {
    [[NSNotificationCenter defaultCenter] removeObserver: observer name: name object: object];
}

@end
