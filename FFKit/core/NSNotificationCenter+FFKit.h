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

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (FFKit)

NS_ASSUME_NONNULL_BEGIN

/**	A handy method to add a UIKeyboardWillShowNotification observer instead of 
    writing out addObserver:selector:name:object.
 
    @see UIKeyboardWillShowNotification, NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addUIKeyboardWillShowNotificationObserver: (id) observer selector: (SEL) selector;

/**	A handy method to add a UIKeyboardDidShowNotification observer instead of
    writing out addObserver:selector:name:object.
 
    @see UIKeyboardDidShowNotification, NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addUIKeyboardDidShowNotificationObserver: (id) observer selector: (SEL) selector;

/**	A handy method to add a UIKeyboardWillHideNotification observer instead of
    writing out addObserver:selector:name:object.
 
    @see UIKeyboardWillHideNotification, NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addUIKeyboardWillHideNotificationObserver: (id) observer selector: (SEL) selector;

/**	A handy method to add a UIKeyboardDidHideNotification observer instead of
    writing out addObserver:selector:name:object.
 
    @see UIKeyboardDidHideNotification, NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addUIKeyboardDidHideNotificationObserver: (id) observer selector: (SEL) selector;

/**	A handy method to add an observer to the default NSNotificationCenter.
 
    @see NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addObserver: (id) observer selector: (SEL) selector name: (nullable NSString*) name;

/**	A handy method to add an observer to the default NSNotificationCenter.
 
    @see NSNotificationCenter#addObserver:selector:name:object
*/
+ (void) addObserver: (id) observer selector: (SEL) selector name: (nullable NSString*) name object: (nullable id) object;

/**	A handy method to remove an observer from the default NSNotificationCenter.
 
    @see NSNotificationCenter#removeObserver:
*/
+ (void) removeObserver: (id) observer;

/**	A handy method to remove an observer from the default NSNotificationCenter.
 
    @see NSNotificationCenter#removeObserver:name:object
*/
+ (void) removeObserver: (id) observer name: (nullable NSString*) name object: (nullable id) object;

NS_ASSUME_NONNULL_END

@end
