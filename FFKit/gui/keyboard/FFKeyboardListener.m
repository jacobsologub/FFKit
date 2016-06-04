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

#import "FFKeyboardListener.h"
#import "FFListenerList.h"
#import "FFListenerListBlockArgs.h"
#import "NSNotificationCenter+FFKit.h"

@interface FFKeyboardListenerInfo (Internal)
- (id) initWithNotification: (NSNotification*) notification;
@end

@implementation FFKeyboardListener
@synthesize willShow;
@synthesize didShow;
@synthesize willHide;
@synthesize didHide;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    if ((self = [super init]) != nil) {
        willShow = [FFListenerList new];
        didShow = [FFListenerList new];
        willHide = [FFListenerList new];
        didHide = [FFListenerList new];
        
        [NSNotificationCenter addUIKeyboardWillShowNotificationObserver: self selector: @selector (keyboardWillShowNotification:)];
        [NSNotificationCenter addUIKeyboardDidShowNotificationObserver: self selector: @selector (keyboardDidShowNotification:)];
        [NSNotificationCenter addUIKeyboardWillHideNotificationObserver: self selector: @selector (keyboardWillHideNotification:)];
        [NSNotificationCenter addUIKeyboardDidHideNotificationObserver: self selector: @selector (keyboardDidHideNotification:)];
    }
    
    return self;
}

- (void) dealloc {
    
}

+ (instancetype) instance {
    static FFKeyboardListener* _keyboardListenerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        _keyboardListenerInstance = [FFKeyboardListener new];
    });
    
    return _keyboardListenerInstance;
}

#pragma mark -
#pragma mark UIKeyboardNotification Targets
//==============================================================================
- (void) keyboardWillShowNotification: (NSNotification*) notification {
    FFKeyboardListenerInfo* info = [[FFKeyboardListenerInfo alloc] initWithNotification: notification];
    [willShow callWithObject: self withObject: info];
}

- (void) keyboardDidShowNotification: (NSNotification*) notification {
    FFKeyboardListenerInfo* info = [[FFKeyboardListenerInfo alloc] initWithNotification: notification];
    [didShow callWithObject: self withObject: info];
}

- (void) keyboardWillHideNotification: (NSNotification*) notification {
    FFKeyboardListenerInfo* info = [[FFKeyboardListenerInfo alloc] initWithNotification: notification];
    [willHide callWithObject: self withObject: info];
}

- (void) keyboardDidHideNotification: (NSNotification*) notification {
    FFKeyboardListenerInfo* info = [[FFKeyboardListenerInfo alloc] initWithNotification: notification];
    [didHide callWithObject: self withObject: info];
}

@end
