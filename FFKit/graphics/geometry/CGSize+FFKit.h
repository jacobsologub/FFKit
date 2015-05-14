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

#include <CoreGraphics/CGGeometry.h>

/** Creates size with the same width and height. */
CG_INLINE CGSize CGSizeMakeAll (CGFloat size) {
    return (CGSize) { size, size };
}

/**	Sets the width for the specified CGSize. */
CG_INLINE CGSize CGSizeSetWidth (CGSize size, CGFloat width) {
    size.width = width;
    return size;
}

/**	Sets the height for the specified CGSize. */
CG_INLINE CGSize CGSizeSetHeight (CGSize size, CGFloat height) {
    size.height = height;
    return size;
}

/** An "empty" size. Note that the Null size is not the
    same as the zero "CGSizeZero" size.
*/
CG_EXTERN const CGSize CGSizeNull;

/** Return true if `size' is a null "CGSizeNull" size, false otherwise.
 
    By default CGSizeNull is defined as { -HUGE_VALF, -HUGE_VALF } but you can
    define it using any values that suit your needs.
 
    @code
        const CGSize CGSizeNull = { -1.0f, -1.0f };
    @code
 
    @see CGPointNull
*/
CG_INLINE bool CGSizeIsNull (CGSize size) {
    return CGSizeEqualToSize (size, CGSizeNull);
}