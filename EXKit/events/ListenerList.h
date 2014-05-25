//
//  ListenerList.h
//  EXKit
//
//  Created by Jacob Sologub on 3/18/14.
//  Copyright (c) 2014 HYPERHYPER, INC. All rights reserved.
//

#ifndef __EX_KIT_LISTENER_LIST__
#define __EX_KIT_LISTENER_LIST__

#include "macros.h"

@class EXListenerList;

begin_namespace (exkit);

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
    
    /** Removes a target and action for from the list.
     
        @param target   The target object—that is, the object to which the 
                        action message is sent.
     
        @param action   A selector identifying an action message. If action is 
                        nil then all action messages paired with target will be
                        removed.
     
        @see addTarget, removeAllTargets
    */
    void removeTarget (id target, SEL action = nil);
    
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
    EXListenerList* list;
    
    ListenerList (const ListenerList&);
    ListenerList& operator= (const ListenerList&);
};

end_namespace (exkit);

#endif // __EX_KIT_LISTENER_LIST__
