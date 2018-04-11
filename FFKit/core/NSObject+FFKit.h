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
#import "FFAssociatedObject.h"

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

/** Gets the value associated with this object for a given key.
 
    @see NSObject#getOrCreateAssociatedObjectForKey
*/
- (id) getAssociatedObjectForKey: (NSString*) key;

/** Gets or creates the value associated with this object for a given key.
 
    @param type         The Class to use when creating the object.
 
    @see NSObject#getOrCreateAssociatedObjectForKey:policy
*/
- (id) getOrCreateAssociatedObjectForKey: (NSString*) key type: (Class) type;

/** Gets or creates the value associated with this object for a given key.
 
    @param policy       The policy to use when creating the object.
    @param type         The Class to use when creating the object.
 
    @see NSObject#get:object:forKey
*/
- (id) getOrCreateAssociatedObjectForKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy type: (Class) type;

/** Gets the value associated with this object for a given selector.
 
    @see NSObject#getAssociatedObjectForSelector
*/
- (id) getAssociatedObjectForSelector: (SEL) selector;

/** Gets or creates the value associated with this object for a given selector.
 
    @param type         The Class to use when creating the object.
 
    @see NSObject#getOrCreateAssociatedObjectForKey:policy
*/
- (id) getOrCreateAssociatedObjectForSelector: (SEL) selector type: (Class) type;

/** Gets or creates the value associated with this object for a given key.
 
    @param policy       The policy to use when creating the object.
    @param type         The Class to use when creating the object.
 
    @see NSObject#getAssociatedObjectForSelector
*/
- (id) getOrCreateAssociatedObjectForSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy type: (Class) type;

/** Sets an associated value for this using a given key.
    
    @see NSObject#setAssociatedObject:forKey:policy
*/
- (void) setAssociatedObject: (id) value forKey: (NSString*) key;

/** Sets an associated value for this object using a given key.
 
    @param policy       The policy to use when creating the object.
    
    @see NSObject#setAssociatedObject:forKey
*/
- (void) setAssociatedObject: (id) value forKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy;

/** Sets an associated value for this object using a given key.
    
    @see NSObject#setAssociatedObject:value:forSelector:policy
*/
- (void) setAssociatedObject: (id) value forSelector: (SEL) selector;

/** Sets an associated value for this object using a given key.
 
    @param policy       The policy to use when creating the object.
    
    @see NSObject#setAssociatedObject:value:forSelector
*/
- (void) setAssociatedObject: (id) value forSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy;

/** Returns the value passed-in or nil if the passed-in value is not an instance
    of this class or an instance of any class that inherits from this class.
*/
+ (instancetype) cast: (id) from;

@end

#pragma once

#if __cplusplus
#include "../utilities/macros.h"
begin_namespace (ffkit)
template <typename T> inline T* objc_cast (id from) {
    if ([from isKindOfClass: [T class]]) {
        return static_cast <T*> (from);
    }
    
    return nil;
}
end_namespace (ffkit)
#endif
