/*
  ==============================================================================
 
   Copyright (C) 2014 Jacob Sologub

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

@interface UIControl (FFKit)

NS_ASSUME_NONNULL_BEGIN

/**	A handy method to add a target/action for an UIControlEventTouchUpInside 
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventTouchUpInsideTarget:action:action
*/
- (void) addUIControlEventTouchUpInsideTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventTouchUpInside
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventTouchUpInsideTarget:action:action
*/
- (void) removeUIControlEventTouchUpInsideTarget: (id) target action: (nullable SEL) action;

/**	A handy method to add a target/action for an UIControlEventValueChanged
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventValueChangedTarget
*/
- (void) addUIControlEventValueChangedTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventValueChanged
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventValueChangedTarget
*/
- (void) removeUIControlEventValueChangedTarget: (id) target action: (nullable SEL) action;

/**	A handy method to add a target/action for an UIControlEventEditingDidBegin
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventEditingDidBeginTarget
*/
- (void) addUIControlEventEditingDidBeginTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventEditingDidBegin
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventEditingDidBeginTarget
*/
- (void) removeUIControlEventEditingDidBeginTarget: (id) target action: (nullable SEL) action;

/**	A handy method to add a target/action for an UIControlEventEditingChanged
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventEditingChangedTarget
*/
- (void) addUIControlEventEditingChangedTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventEditingChanged
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventEditingChangedTarget
*/
- (void) removeUIControlEventEditingChangedTarget: (id) target action: (nullable SEL) action;

/**	A handy method to add a target/action for an UIControlEventEditingDidEnd
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventEditingDidEndTarget
*/
- (void) addUIControlEventEditingDidEndTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventEditingDidEnd
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventEditingDidEndTarget
*/
- (void) removeUIControlEventEditingDidEndTarget: (id) target action: (nullable SEL) action;

/**	A handy method to add a target/action for an UIControlEventEditingDidEndOnExit
    event instead of writing out addTarget:action:forControlEvents:.
 
    @see removeUIControlEventEditingDidEndTarget
*/
- (void) addUIControlEventEditingDidEndOnExitTarget: (id) target action: (SEL) action;

/**	A handy method to remove a target/action for an UIControlEventEditingDidEndOnExit
    event instead of writing out removeTarget:action:forControlEvents:.
 
    @see addUIControlEventEditingDidEndTarget
*/
- (void) removeUIControlEventEditingDidEndOnExitTarget: (id) target action: (nullable SEL) action;

NS_ASSUME_NONNULL_END

@end
