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

@interface NSObject (FFKit)

/** Sends a message to the receiver by calling respondsToSelector first to check
    whether or not this object can responds to the specified selector.
 
    @see NSObject#performSelector
 */
- (id) performSelectorChecked: (SEL) selector;

/** Sends a message to the receiver with an object as the argument by calling
    respondsToSelector first to check whether or not this object can responds to
    the specified selector.
 
    @see NSObject#performSelector:withObject
 */
- (id) performSelectorChecked: (SEL) selector withObject: (id) object1;

/** Sends a message to the receiver with two objects as arguments by calling
    respondsToSelector first to check whether or not this object can responds to
    the specified selector.
 
    @see NSObject#performSelector:withObject:withObject
 */
- (id) performSelectorChecked: (SEL) selector withObject: (id) object1 withObject: (id) object2;

/** Returns a Boolean value that indicates whether the receiver is NOT an 
    instance of given class or an instance of any class that inherits from that 
    class.
 
    @see NSObject#isKindOfClass
*/
- (BOOL) isNotKindOfClass: (Class) aClass;

/** Returns a Boolean value that indicates whether the receiver is NOT an 
    instance of a given class.

    @see NSObject#isMemberOfClass
*/
- (BOOL) isNotMemberOfClass: (Class) aClass;

/** Returns a Boolean value that indicates whether the receiver is an instance 
    of NSNull class.
 
    @see NSObject#isKindOfClass
*/
- (BOOL) isNull;

/** Returns a Boolean value that indicates whether the receiver is NOT an 
    instance of NSNull class.
 
    @see NSObject#isKindOfClass
*/
- (BOOL) isNotNull;

@end
