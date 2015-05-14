/*
  ==============================================================================
 
   Copyright (C) 2015 Jacob Sologub

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

#include <CoreGraphics/CGGeometry.h>

/** Creates point with the same x and y coordinates. */
CG_INLINE CGPoint CGPointMakeAll (CGFloat coord) {
    return (CGPoint) { coord, coord };
}

/** An "empty" point. Note that the Null point is not the
    same as the zero "CGPointZero" point.
*/
CG_EXTERN const CGPoint CGPointNull;

/** Return true if `point' is a null "CGPointNull" point, false otherwise. 
 
    By default CGPointNull is defined as { HUGE_VALF, HUGE_VALF } but you can 
    define it using any values that suit your needs.
 
    @code
        const CGPoint CGPointNull = { -1.0f, -1.0f };
    @code
 
    @see CGPointNull
*/
CG_INLINE bool CGPointIsNull (CGPoint point) {
    return CGPointEqualToPoint (point, CGPointNull);
}
