//
//  ListenerList.cpp
//  EXKit
//
//  Created by Jacob Sologub on 3/18/14.
//  Copyright (c) 2014 HYPERHYPER, INC. All rights reserved.
//

#include "ListenerList.h"
#include "EXListenerList.h"

begin_namespace (exkit);

ListenerList::ListenerList()
  : list (nil)
{
    list = [EXListenerList new];
}

ListenerList::~ListenerList() {
    [list release];
    list = nil;
}

//==============================================================================
void ListenerList::addTarget (id target, SEL action) {
    [list addTarget: target action: action];
}

void ListenerList::removeTarget (id target, SEL action) {
    [list removeTarget: target action: action];
}

void ListenerList::removeAllTargets() {
    [list removeAllTargets];
}

//==============================================================================
void ListenerList::call() const {
    [list call];
}

void ListenerList::call (id object1) const {
    [list callWithObject: object1];
}

void ListenerList::call (id object1, id object2) const {
    [list callWithObject: object1 withObject: object2];
}

end_namespace (hhkit);