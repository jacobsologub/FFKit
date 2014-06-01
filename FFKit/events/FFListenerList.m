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

#import "FFListenerList.h"
#import "NSObject+FFKit.h"

NSString* const FFListenerListTargetKey = @"FFListenerListTargetKey";
NSString* const FFListenerListActionKey = @"FFListenerListActionKey";

@implementation FFListenerList

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    if ((self = [super init]) != nil) {
        listeners = [NSMutableArray new];
    }
    
    return self;
}

- (void) dealloc {
    [listeners removeAllObjects];
   #if !__has_feature (objc_arc)
    [listeners release];
    [super dealloc];
   #endif
}

//==============================================================================
- (void) addTarget: (id) target action: (SEL) action {
    if (![self contains: target action: action]) {
        [listeners addObject: @{ FFListenerListTargetKey: [NSValue valueWithPointer: (void*) target], FFListenerListActionKey: NSStringFromSelector (action) }];
    }
}

- (void) removeTarget: (id) target action: (SEL) action {
    NSIndexSet* indexSet = nil;
    if (action == nil) {
        indexSet = [listeners indexesOfObjectsPassingTest: ^BOOL (NSDictionary* obj, NSUInteger idx, BOOL* stop) {
            if ([obj [FFListenerListTargetKey] isEqualToValue: [NSValue valueWithPointer: (void*) target]]) {
                return YES;
            }
            
            return NO;
        }];
    }
    else {
        indexSet = [listeners indexesOfObjectsPassingTest: ^BOOL (NSDictionary* obj, NSUInteger idx, BOOL* stop) {
            if ([obj [FFListenerListTargetKey] isEqualToValue: [NSValue valueWithPointer: (void*) target]]
                && [obj [FFListenerListActionKey] isEqualToString: NSStringFromSelector (action)]) {
                *stop = YES;
                return YES;
            }
            
            return NO;
        }];
    }
    
    if (indexSet != nil) {
        [listeners removeObjectsAtIndexes: indexSet];
    }
}

- (void) removeAllTargets {
    [listeners removeAllObjects];
}

//==============================================================================
- (void) call {
    for (NSDictionary* obj in listeners) {
        id target = [obj [FFListenerListTargetKey] pointerValue];
        SEL action = NSSelectorFromString (obj [FFListenerListActionKey]);
        
        [target performSelectorChecked: action];
    }
}

- (void) callWithObject: (id) object1 {
    for (NSDictionary* obj in listeners) {
        id target = [obj [FFListenerListTargetKey] pointerValue];
        SEL action = NSSelectorFromString (obj [FFListenerListActionKey]);
        
        [target performSelectorChecked: action withObject: object1];
    }
}

- (void) callWithObject: (id) object1 withObject: (id) object2 {
    for (NSDictionary* obj in listeners) {
        id target = [obj [FFListenerListTargetKey] pointerValue];
        SEL action = NSSelectorFromString (obj [FFListenerListActionKey]);
        
        [target performSelectorChecked: action withObject: object1 withObject: object2];
    }
}

- (BOOL) contains: (id) target action: (SEL) action {
    NSUInteger index = [listeners indexOfObjectPassingTest: ^BOOL (NSDictionary* obj, NSUInteger idx, BOOL* stop) {
        if ([obj [FFListenerListTargetKey] isEqualToValue: [NSValue valueWithPointer: (void*) target]]
            && [obj [FFListenerListActionKey] isEqualToString: NSStringFromSelector (action)]) {
            *stop = YES;
            return YES;
        }
        
        return NO;
    }];
    
    return index != NSNotFound;
}

@end
