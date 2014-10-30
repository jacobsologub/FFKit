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

#ifndef __FF_KIT_LISTENER_LIST__
#define __FF_KIT_LISTENER_LIST__

#include "../utilities/macros.h"

@class FFListenerList;
@class FFListenerListBlockArgs;

begin_namespace (ffkit);

typedef void (^FFListenerListBlock) (FFListenerListBlockArgs* args);

class ListenerList {
public:
    /** Creates an empty list. */
    ListenerList();
    
    /** Destructor. */
    ~ListenerList();
    
    //==============================================================================
    /** Adds a target and action to the list.
     
        @param target   The target object—that is, the object to which the 
                        action message is sent.
     
        @param action   A selector identifying an action message.
     
        @see removeTarget, removeAllTargets
    */
    void addTarget (id target, SEL action);
    
    /** Adds a block "target" to the list.
     
        @param target   The block to which the action message is sent.
     
        @see FFListenerListBlock
    */
    void addTarget (FFListenerListBlock block);
    
    /** Removes a target and action for from the list.
     
        @param target   The target object—that is, the object to which the 
                        action message is sent.
     
        @param action   A selector identifying an action message. If action is 
                        nil then all action messages paired with target will be
                        removed.
     
        @see addTarget, removeAllTargets
    */
    void removeTarget (id target, SEL action = nil);
    
    /** Removes a block target from the list.
     
        @param block    The block to remove from the list.
     
        @see addTarget, removeAllTargets
    */
    void removeTarget (FFListenerListBlock block);
    
    /** Removes all target from the list.
     
        @see addTarget, removeTarget
    */
    void removeAllTargets();
    
    //==============================================================================
    /** Calls a selector on each listener in the list, with no parameters.
     
        @see call
    */
    void call() const;
    
    /** Calls a selector on each listener in the list, with 1 parameter.
     
        @see call
     */
    void call (id object1) const;
    
    /** Calls a selector on each listener in the list, with 2 parameters.
     
        @see call
    */
    void call (id object1, id object2) const;
    
private:
    FFListenerList* list;
    
    ListenerList (const ListenerList&);
    ListenerList& operator= (const ListenerList&);
};

end_namespace (ffkit);

#endif // __FF_KIT_LISTENER_LIST__
