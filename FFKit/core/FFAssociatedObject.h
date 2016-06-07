//
//  NSObjectAssociatedObject.h
//  FFKit
//
//  Created by Jacob Sologub on 6/6/16.
//  Copyright © 2016 Jacob Sologub. All rights reserved.
//

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
