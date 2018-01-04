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

#if defined (__cplusplus)
 #include <vector>
 #include <functional>
#endif

@interface NSArray<__covariant ObjectType> (FFKit)

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

/** Returns the indexes of objects whose corresponding array value is equal to
    a given Class.
 
    @see indexesOfObjectsOfClassType:inRange
*/
- (NSIndexSet*) indexesOfObjectsOfClassType: (Class) classType;

/** Returns the indexes of objects within a specified range whose corresponding
    array value is equal to a given Class.
 
    @see indexesOfObjectsOfClassType:inRange
*/
- (NSIndexSet*) indexesOfObjectsOfClassType: (Class) classType inRange: (NSRange) range;

/** Returns the first object whose corresponding array value is equal to a given
    Class.
 
    @see indexOfObjectOfClassType:inRange
*/
- (ObjectType) objectOfClassType: (Class) classType;

/** Returns the first object within a specified range whose corresponding array
    value is equal to a given Class.
 
    @see indexOfObjectOfClassType
*/
- (ObjectType) objectOfClassType: (Class) classType inRange: (NSRange) range;

/** Returns a new array that is shuffled version of the receiving array. 
    
    @see NSMutableArray#shuffleArray
*/
- (NSArray*) shuffledArray;

/** Returns a new array by mapping each value in this array through a 
    transformation block.
*/
- (NSArray*) mappedArray: (id (^)(ObjectType obj, NSUInteger idx, BOOL* stop)) block;

/** Returns the number of objects in the array satisfying a specific criteria.
    
    @see NSArray#count
*/
- (NSUInteger) count: (BOOL (^)(id obj, NSUInteger idx, BOOL* stop)) predicate;

@end

#if defined (__cplusplus)
namespace ffkit {
    struct FFArray {
        template <class FromType, class ToType>
        static inline std::vector<ToType> makeVector (NSArray<FromType>* array, std::function<ToType (FromType)> f) {
            std::vector<ToType> result;
            for (FromType v in array) {
                result.push_back (f (v));
            }
            
            return result;
        }
    };
}
#endif
