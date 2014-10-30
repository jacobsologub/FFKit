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

#import <Foundation/Foundation.h>

@class FFListenerListBlockArgs;
typedef void (^FFListenerListBlock) (FFListenerListBlockArgs* args);

@interface FFListenerList : NSObject {
@private
    NSMutableArray* listeners;
}

//==============================================================================
/** Adds a target and action to the list.
    
    @param target   The target object—that is, the object to which the action 
                    message is sent.
 
    @param action   A selector identifying an action message.
 
    @see removeTarget, removeAllTargets
*/
- (void) addTarget: (id) target action: (SEL) action;

/** Adds a block "target" to the list.
    
    @param target   The block to which the action message is sent.
 
    @see FFListenerListBlock
*/
- (void) addTarget: (FFListenerListBlock) block;

/** Removes a target and action for from the list.
 
    @param target   The target object—that is, the object to which the action
                    message is sent.
 
    @param action   A selector identifying an action message. Pass nil to remove 
                    all action messages paired with target.
 
    @see addTarget, removeAllTargets
*/
- (void) removeTarget: (id) target action: (SEL) action;

/** Removes a block target from the list.
 
    @param block    The block to remove from the list.
 
    @see addTarget, removeAllTargets
*/
- (void) removeTarget: (FFListenerListBlock) block;

/** Removes all target from the list.
 
    @see addTarget, removeTarget
*/
- (void) removeAllTargets;

/** Adds target(s)/action(s) from another list to this list.
 
    @see addTarget, removeTarget
*/
- (void) addTargetsFromList: (FFListenerList*) list;

//==============================================================================
/** Calls a selector on each listener in the list, with no parameters.
 
    @see callWithObject, callWithObject:object2
*/
- (void) call;

/** Calls a selector on each listener in the list, with 1 parameter.
 
    @see call, callWithObject:object2
*/
- (void) callWithObject: (id) object1;

/** Calls a selector on each listener in the list, with 2 parameters.
 
    @see call, callWithObject
*/
- (void) callWithObject: (id) object1 withObject: (id) object2;

@end
