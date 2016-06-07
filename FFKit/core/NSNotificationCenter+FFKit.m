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
#import "FFAssociatedObject.h"
#import <UIKit/UIWindow.h>

#if __has_include ("../../../FFKitConfig.h")
 #include "../../../FFKitConfig.h"
#endif

#ifdef FFKIT_USE_ASPECTS
#import "FFKeyboardListener.h"
#import "FFListenerList.h"
#import "FFListenerListBlockArgs.h"

static inline NSValue* NSBLockValue (id block) {
    return [NSValue valueWithNonretainedObject: block];
}

static NSString* const kFFKitBlockListKey = @"kFFKitBlockListKey";

@interface FFKeyboardListener (Internal)
- (void) keyboardWillShowNotification: (NSNotification*) notification;
- (void) keyboardDidShowNotification: (NSNotification*) notification;
- (void) keyboardWillHideNotification: (NSNotification*) notification;
- (void) keyboardDidHideNotification: (NSNotification*) notification;
@end

@interface FFKeyboardListenerInfo (Internal)
- (id) initWithNotification: (NSNotification*) notification;
@end

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
+ (void) addUIKeyboardNotificationObserver: (NSString*) notificationName block: (UIKeyboardWillShowNotificationObserverBlock) block {
    NSMutableArray* const list = [FFAssociatedObject getOrCreate: self forKey: kFFKitBlockListKey type: [NSMutableArray class]];
    if (![list containsObject: NSBLockValue (block)]) {
        [list addObject: NSBLockValue (block)];
        
        SEL selector = NULL;
        if ([notificationName isEqualToString: UIKeyboardWillShowNotification]) {
            selector = @selector (keyboardWillShowNotification:);
        }
        else if ([notificationName isEqualToString: UIKeyboardDidShowNotification]) {
            selector = @selector (keyboardDidShowNotification:);
        }
        else if ([notificationName isEqualToString: UIKeyboardWillHideNotification]) {
            selector = @selector (keyboardWillHideNotification:);
        }
        else if ([notificationName isEqualToString: UIKeyboardDidHideNotification]) {
            selector = @selector (keyboardDidHideNotification:);
        }
        
        FFKeyboardListener* keyboardListener = [FFKeyboardListener instance];
        [keyboardListener aspect_hookSelector: selector
            withOptions: AspectPositionBefore
            usingBlock: ^(id<AspectInfo> aspectInfo, NSNotification* notification) {
                
                FFKeyboardListenerInfo* keyboardListenerInfo = [[FFKeyboardListenerInfo alloc] initWithNotification: notification];
                block (keyboardListenerInfo);
            
            } error: NULL
        ];
    }
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
