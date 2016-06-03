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

@implementation NSNotificationCenter (FFKit)

+ (void) addUIKeyboardWillShowNotificationObserver: (id) observer selector: (SEL) selector {
    [[NSNotificationCenter defaultCenter] addObserver: observer selector: selector name: UIKeyboardWillShowNotification object: nil];
}

+ (void) addUIKeyboardDidShowNotificationObserver: (id) observer selector: (SEL) selector {
    [[NSNotificationCenter defaultCenter] addObserver: observer selector: selector name: UIKeyboardDidShowNotification object: nil];
}

+ (void) addUIKeyboardWillHideNotificationObserver: (id) observer selector: (SEL) selector {
    [[NSNotificationCenter defaultCenter] addObserver: observer selector: selector name: UIKeyboardWillHideNotification object: nil];
}

+ (void) addUIKeyboardDidHideNotificationObserver: (id) observer selector: (SEL) selector {
    [[NSNotificationCenter defaultCenter] addObserver: observer selector: selector name: UIKeyboardDidHideNotification object: nil];
}

+ (void) removeObserver: (id) observer {
    [[NSNotificationCenter defaultCenter] removeObserver: observer];
}

+ (void) removeObserver: (id) observer name: (nullable NSString*) name object: (nullable id) object {
    [[NSNotificationCenter defaultCenter] removeObserver: observer name: name object: object];
}

@end
