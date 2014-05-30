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

#import "NSMutableArray+FFKit.h"

@implementation NSMutableArray (FFKit)

- (void) shuffleArray {
    const NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        const NSInteger elements = count - i;
        const NSInteger index = arc4random_uniform ((int) elements) + i;
        [self exchangeObjectAtIndex: i withObjectAtIndex: index];
    }
}

- (void) moveObjectAtIndex: (NSUInteger) index toIndex: (NSInteger) toIndex {
    if (toIndex != index) {
		id objectToMove = [self objectAtIndex: index];
		[self removeObjectAtIndex: index];
        
		if (toIndex >= self.count || toIndex < 0) {
			[self addObject: objectToMove];
		}
		else {
			[self insertObject: objectToMove atIndex: toIndex];
		}
	}
}

@end
