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

#import "NSObject+EXKit.h"

typedef NS_ENUM (NSUInteger, NSMethodSignatureReturnType) {
    NSMethodSignatureReturnTypeVoid = 0,
    NSMethodSignatureReturnTypeOther
};

static inline NSMethodSignatureReturnType methodSignatureReturnType (id object, SEL selector) {
    NSMethodSignatureReturnType result = NSMethodSignatureReturnTypeOther;
    
    NSMethodSignature* methodSignature = [object methodSignatureForSelector: selector];
    const char* returnType = [methodSignature methodReturnType];
    if (strcmp (returnType, @encode (void)) == 0) {
        result = NSMethodSignatureReturnTypeVoid;
    }
    
    return result;
}

@implementation NSObject (EXKit)

- (id) performSelectorChecked: (SEL) selector {
    if ([self respondsToSelector: selector]) {
       #if __has_feature (objc_arc)
       #pragma clang diagnostic push
       #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if (methodSignatureReturnType (self, selector) == NSMethodSignatureReturnTypeVoid) {
            [self performSelector: selector];
            return nil;
        }
        
        return [self performSelector: selector];
       #pragma clang diagnostic pop
       #else
        return [self performSelector: selector];
       #endif
    }
    
    return nil;
}

- (id) performSelectorChecked: (SEL) selector withObject: (id) object1 {
    if ([self respondsToSelector: selector]) {
       #if __has_feature (objc_arc)
       #pragma clang diagnostic push
       #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if (methodSignatureReturnType (self, selector) == NSMethodSignatureReturnTypeVoid) {
            [self performSelector: selector withObject: object1];
            return nil;
        }
        
        return [self performSelector: selector withObject: object1];
       #pragma clang diagnostic pop
       #else
        return [self performSelector: selector withObject: object1];
       #endif
    }
    
    return nil;
}

- (id) performSelectorChecked: (SEL) selector withObject: (id) object1 withObject: (id) object2 {
    if ([self respondsToSelector: selector]) {
       #if __has_feature (objc_arc)
       #pragma clang diagnostic push
       #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if (methodSignatureReturnType (self, selector) == NSMethodSignatureReturnTypeVoid) {
            [self performSelector: selector withObject: object1 withObject: object2];
            return nil;
        }
        
        return [self performSelector: selector withObject: object1 withObject: object2];
       #pragma clang diagnostic pop
       #else
        return [self performSelector: selector withObject: object1 withObject: object2];
       #endif
    }
    
    return nil;
}

- (BOOL) isNotKindOfClass: (Class) aClass {
    return ![self isKindOfClass: aClass];
}

- (BOOL) isNotMemberOfClass: (Class) aClass {
    return ![self isMemberOfClass: aClass];
}

- (BOOL) isNull {
    return [self isKindOfClass: [NSNull class]];
}

- (BOOL) isNotNull {
    return ![self isNull];
}

@end
