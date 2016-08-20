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

typedef NS_ENUM (NSUInteger, FFAssociatedObjectPolicy) {
    FFAssociatedObjectPolicyAssign = 0,
    FFAssociatedObjectPolicyRetain,
    FFAssociatedObjectPolicyCopy,
    FFAssociatedObjectPolicyRetainNonatomic,
    FFAssociatedObjectPolicyCopyNonatomic,
};

@interface FFAssociatedObject <ObjectType: id> : NSObject

/** Gets the value associated with a given object for a given key.
 
    @see FFAssociatedObject#getOrCreate:object:forKey
*/
+ (ObjectType) get: (id) object forKey: (NSString*) key;

/** Gets or creates the value associated with a given object for a given key.
 
    @see FFAssociatedObject#getOrCreate:object:forKey:policy
*/
+ (ObjectType) getOrCreate: (id) object forKey: (NSString*) key type: (Class) type;

/** Gets or creates the value associated with a given object for a given key and 
    association policy.
 
    @see FFAssociatedObject#get:object:forKey
*/
+ (ObjectType) getOrCreate: (id) object forKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy type: (Class) type;

/** Gets the value associated with a given object for a given selector.
 
    @see FFAssociatedObject#getOrCreate:object:forSelector
*/
+ (ObjectType) get: (id) object forSelector: (SEL) selector;

/** Gets or creates the value associated with a given object for a given selector.
 
    @see FFAssociatedObject#getOrCreate:object:forSelector:policy
*/
+ (ObjectType) getOrCreate: (id) object forSelector: (SEL) selector type: (Class) type;

/** Gets or creates the value associated with a given object for a given key and 
    association policy.
 
    @see FFAssociatedObject#get:object:forSelector
*/
+ (ObjectType) getOrCreate: (id) object forSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy type: (Class) type;

/** Sets an associated value for a given object using a given key.
    
    @see FFAssociatedObject#set:object:value:forKey:policy
*/
+ (void) set: (id) object value: (id) value forKey: (NSString*) key;

/** Sets an associated value for a given object using a given key.
    
    @see FFAssociatedObject#set:object:value:forKey
*/
+ (void) set: (id) object value: (id) value forKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy;

/** Sets an associated value for a given object using a given key.
    
    @see FFAssociatedObject#set:object:value:forSelector:policy
*/
+ (void) set: (id) object value: (id) value forSelector: (SEL) selector;

/** Sets an associated value for a given object using a given key.
    
    @see FFAssociatedObject#set:object:value:forSelector
*/
+ (void) set: (id) object value: (id) value forSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy;

@end
