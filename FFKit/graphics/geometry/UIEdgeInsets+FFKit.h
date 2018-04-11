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

#pragma once

#include <CoreGraphics/CGGeometry.h>

/** Creates an edge inset for the specified inset for all sides */
UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMakeAll (CGFloat inset) {
    UIEdgeInsets insets = { inset, inset, inset, inset };
    return insets;
}

/** Creates an edge inset for the specified inset for the top and bottom sides */
UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMakeTopBottom (CGFloat inset) {
    UIEdgeInsets insets = { inset, 0.0f, inset, 0.0f };
    return insets;
}

/** Creates an edge inset for the specified inset for the left and right sides */
UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMakeLeftRight (CGFloat inset) {
    UIEdgeInsets insets = { 0.0f, inset, 0.0f, inset };
    return insets;
}
