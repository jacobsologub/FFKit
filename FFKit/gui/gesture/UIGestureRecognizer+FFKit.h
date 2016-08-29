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

#import <UIKit/UIKit.h>
#import "../../events/FFListenerList.h"

#if __has_include ("../../../../FFKitConfig.h")
 #include "../../../../FFKitConfig.h"
#endif

NS_ASSUME_NONNULL_BEGIN

#ifdef FFKIT_USE_ASPECTS
  typedef FFListenerListBlock UIGestureRecognizerBlock;
#endif

@interface UIGestureRecognizer (FFKit)

#ifdef FFKIT_USE_ASPECTS
/** Adds a block target to a gesture-recognizer object. To use this method
    FFKIT_USE_ASPECTS has to be defined in FFKitConfig.h 
    
    @see FFKit.h
 
    @code
    #ifndef FFKIT_USE_ASPECTS
      #include "../Pods/Aspects/Aspects.h"
      #define FFKIT_USE_ASPECTS
    #endif
    @code
 
    @see FFListenerListBlock, FFListenerListBlockArgs
*/
- (void) addTargetWithBlock: (UIGestureRecognizerBlock) block;
#endif

@end

NS_ASSUME_NONNULL_END
