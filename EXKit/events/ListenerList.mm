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

end_namespace (exkit);