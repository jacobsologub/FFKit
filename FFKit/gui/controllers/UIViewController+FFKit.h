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

#import <UIKit/UIKit.h>

@interface UIViewController (FFKit)

#ifdef FFKIT_USE_ASPECTS

/** Sets a block that will be invoked after this view controller's 
    viewWillAppear: method is invoked.
    
    @see UIViewController#viewWillAppear:
*/
- (void) setViewWillAppearBlock: (void (^) (BOOL animated)) block;

/** Sets a block that will be invoked after this view controller's
    viewDidAppear: method is invoked.
 
    @see UIViewController#viewDidAppear:
*/
- (void) setViewDidAppearBlock: (void (^) (BOOL animated)) block;

/** Sets a block that will be invoked after this view controller's
    viewWillDisappear: method is invoked.
 
    @see UIViewController#viewWillDisappear:
*/
- (void) setViewWillDisappearBlock: (void (^) (BOOL animated)) block;

/** Sets a block that will be invoked after this view controller's
    viewDidDisappear: method is invoked.
 
    @see UIViewController#viewDidDisappear:
*/
- (void) setViewDidDisappearBlock: (void (^) (BOOL animated)) block;

#endif

//==============================================================================
/** Searches the controller's child view controllers for a UIViewController of 
    a specified class. 
*/
- (UIViewController*) childViewControllerOfClassType: (Class) classType;

/** Searches the controller's child view controllers for a UIViewController of
    a specified class.
*/
- (UIViewController*) childViewControllerOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively;

/** Returns the controller's top-level view controller.
 
    @see UIViewController#presentedViewController
*/
- (UIViewController*) toplevelViewController;

@end
