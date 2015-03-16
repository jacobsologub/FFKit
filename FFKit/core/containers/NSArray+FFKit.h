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

@interface NSArray (FFKit)

/** Returns the lowest index whose corresponding array value is equal to a given 
    Class.
 
    @see indexOfObjectOfClassType:inRange
*/
- (NSUInteger) indexOfObjectOfClassType: (Class) classType;

/** Returns the lowest index within a specified range whose corresponding array 
    value is equal to a given Class.
 
    @see indexOfObjectOfClassType
*/
- (NSUInteger) indexOfObjectOfClassType: (Class) classType inRange: (NSRange) range;

/** Returns a new array that is shuffled version of the receiving array. 
    
    @see NSMutableArray#shuffleArray
*/
- (NSArray*) shuffledArray;

/** Returns a new array by mapping each value in this array through a 
    transformation block.
*/
- (NSArray*) mappedArray: (id (^)(id obj, NSUInteger idx, BOOL* stop)) block;

@end
