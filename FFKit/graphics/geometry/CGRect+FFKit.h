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

/**	Sets the x coordinate for the specified CGRect. */
CG_INLINE CGRect CGRectSetX (CGRect rect, CGFloat x) {
    rect.origin.x = x;
    return rect;
}

/**	Sets the y coordinate for the specified CGRect. */
CG_INLINE CGRect CGRectSetY (CGRect rect, CGFloat y) {
    rect.origin.y = y;
    return rect;
}

/**	Sets the width for the specified CGRect. */
CG_INLINE CGRect CGRectSetWidth (CGRect rect, CGFloat width) {
    rect.size.width = width;
    return rect;
}

/**	Sets the height for the specified CGRect. */
CG_INLINE CGRect CGRectSetHeight (CGRect rect, CGFloat height) {
    rect.size.height = height;
    return rect;
}

/**	Returns the x coordinate for the specified CGRect. */
CG_INLINE CGFloat CGRectGetX (CGRect rect) {
    return rect.origin.x;
}

/**	Returns the y coordinate for the specified CGRect. */
CG_INLINE CGFloat CGRectGetY (CGRect rect) {
    return rect.origin.y;
}

/** Returns a rectangle with the specified coordinate and size values expanded 
    to the smallest rect containing it with integral origin and size.
 
    @see CGRectIntegral, CGRectMake
*/
CG_INLINE CGRect CGRectMakeIntegral (CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectIntegral (CGRectMake (x, y, width, height));
}