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
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIView.h>

@interface FFKeyboardListenerInfo : NSObject

/** The UIViewAnimationOptions constant that defines how the keyboard will be 
    animated onto or off the screen.
 
    @see UIKeyboardAnimationCurveUserInfoKey
*/
@property (nonatomic, readonly) UIViewAnimationOptions animationOptions;

/** The duration of the animation in seconds.
 
    @see UIKeyboardAnimationDurationUserInfoKey
*/
@property (nonatomic, readonly) double animationDuration;

/** The start frame of the keyboard in screen coordinates. These coordinates do 
    not take into account any rotation factors applied to the window’s contents 
    as a result of interface orientation changes. Thus, you may need to convert 
    the rectangle to window coordinates (using the convertRect:fromWindow: method) 
    or to view coordinates (using the convertRect:fromView: method) before 
    using it.
    
    @see UIKeyboardFrameBeginUserInfoKey
*/
@property (nonatomic, readonly) CGRect beginFrame;

/** The end frame of the keyboard in screen coordinates. These coordinates do 
    not take into account any rotation factors applied to the window’s contents 
    as a result of interface orientation changes. Thus, you may need to convert 
    the rectangle to window coordinates (using the convertRect:fromWindow: method) 
    or to view coordinates (using the convertRect:fromView: method) before 
    using it.
    
    @see UIKeyboardFrameEndUserInfoKey
*/
@property (nonatomic, readonly) CGRect endFrame;

/** A Boolean that identifies whether the keyboard belongs to the current app.
    
    @see UIKeyboardIsLocalUserInfoKey
*/
@property (nonatomic, readonly) BOOL isLocal;

@end
