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

#import "NSArray+FFKit.h"
#import "NSMutableArray+FFKit.h"

@implementation NSArray (FFKit)

- (NSUInteger) indexOfObjectOfClassType: (Class) classType {
    return [self indexOfObjectOfClassType: classType inRange: NSMakeRange (0, [self count])];
}

- (NSUInteger) indexOfObjectOfClassType: (Class) classType inRange: (NSRange) range {
    NSArray* array = [self subarrayWithRange: range];
    return [array indexOfObjectPassingTest: ^BOOL (id obj, NSUInteger idx, BOOL* stop) {
        if ([obj isKindOfClass: classType]) {
            *stop = YES;
            return YES;
        }
        
        return NO;
    }];
}

- (id) objectOfClassType: (Class) classType {
    id result = nil;
    
    const NSUInteger _index = [self indexOfObjectOfClassType: classType];
    if (_index != NSNotFound) {
        result = self [_index];
    }
    
    return result;
}

- (id) objectOfClassType: (Class) classType inRange: (NSRange) range {
    id result = nil;
    
    const NSUInteger _index = [self indexOfObjectOfClassType: classType inRange: range];
    if (_index != NSNotFound) {
        result = self [_index];
    }
    
    return result;
}

- (NSArray*) shuffledArray {
    NSMutableArray* mutableSelf = [self mutableCopy];
    [mutableSelf shuffleArray];
    return mutableSelf;
}

- (NSArray*) mappedArray: (id (^)(id obj, NSUInteger idx, BOOL* stop)) block {
    if ([self count] <= 0) {
        return nil;
    }
    
    NSMutableArray* result = [NSMutableArray new];
    NSUInteger idx = 0;
    
    for (id obj in self) {
        BOOL stop = NO;
        [result addObjectChecked: block (obj, idx, &stop)];
        
        if (stop) {
            break;
        }
        
        ++idx;
    }
    
    return result;
}

- (NSUInteger) count: (BOOL (^)(id obj, NSUInteger idx, BOOL* stop)) predicate {
    if ([self count] <= 0) {
        return 0;
    }
    
    NSIndexSet* set = [self indexesOfObjectsPassingTest: predicate];
    return [set count];
}

@end
