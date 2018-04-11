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

#pragma once

#import <Foundation/Foundation.h>
#import "FFKeyboardListenerInfo.h"

@class FFListenerList;

@interface FFKeyboardListener : NSObject
/** Called prior to the display of the keyboard.
    
    Valid action method signatures:
 
    @code
    - (void) keyboardListener: (FFKeyboardListener*) listener willShow: (FFKeyboardListenerInfo) info;
    - (void) keyboardWillShow: (FFKeyboardListener*) listener info: (FFKeyboardListenerInfo) info;
    @endcode
 
    Block based option:
 
    @code
    [[FFKeyboardListener instance].willHide addTarget: ^(FFListenerListBlockArgs<FFKeyboardListener*, FFKeyboardListenerInfo*>* args) {
        // Do stuff.
    }];
    @endcode
 
    @see UIKeyboardWillShowNotification
*/
@property (nonatomic, readonly) FFListenerList* willShow;

/** Called after the display of the keyboard.
 
    @see UIKeyboardDidShowNotification
*/
@property (nonatomic, readonly) FFListenerList* didShow;

/** Called prior to the dismissal of the keyboard.
 
    @see UIKeyboardWillHideNotification
*/
@property (nonatomic, readonly) FFListenerList* willHide;

/** Called after the dismissal of the keyboard.
 
    @see UIKeyboardDidHideNotification
*/
@property (nonatomic, readonly) FFListenerList* didHide;

/** Returns a shared instance of this object.
 
    @see FFKeyboardListener, @see FFKeyboardListenerInfo
*/
+ (instancetype) instance;

@end
