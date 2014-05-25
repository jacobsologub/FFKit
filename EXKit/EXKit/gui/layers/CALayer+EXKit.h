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

#import <QuartzCore/QuartzCore.h>

//==============================================================================
/**	CAShadow struct
 
    A structure that contains all available CALayer properties to represent a 
    shadow.
 */
struct CAShadow
{
	float shadowOpacity;
	CGFloat shadowRadius;
	CGSize shadowOffset;
	CGColorRef shadowColor;
    CGPathRef shadowPath;
};
typedef struct CAShadow CAShadow;

/**	Returns a CAShadow with the specified CALayer values. */
CA_INLINE CAShadow CAShadowMake (float shadowOpacity, CGFloat shadowRadius, CGSize shadowOffset, CGColorRef shadowColor, CGPathRef shadowPath) {
	CAShadow shadow = { shadowOpacity, shadowRadius, shadowOffset,  shadowColor, shadowPath };
	return shadow;
}

/**	A CAShadow constant with shadowOpacity equal to 0.0f, shadowRadius
    equal to 0.0f shadowOffset equal to 0.0f shadowColor equal to NULL and a
    shadowPath equal to NULL.
*/
extern const CAShadow CAShadowZero;

@interface CALayer (EXKit)

/** Gets or sets the CAShadow struct for this layer*/
@property (nonatomic, assign) CAShadow shadow;

//==============================================================================
/**	Returns the x coordinate of the layer's left edge. */
@property (nonatomic, readonly) float x;

/**	Returns the y coordinate of the layer's top edge. */
@property (nonatomic, readonly) float y;

/**	Returns the width of the layer. */
@property (nonatomic, readonly) float width;

/**	Returns the height of the layer. */
@property (nonatomic, readonly) float height;

/**	Returns the x coordinate of the layer's right edge. */
@property (nonatomic, readonly) float right;

/**	Returns the y coordinate of the layer's bottom edge. */
@property (nonatomic, readonly) float bottom;

/** Changes the layer's size and centres it within its superlayer. */
- (void) centerWithSize: (CGSize) newSize;

/**	Gets or sets whether or not the layer is visible. */
@property (nonatomic, assign) BOOL visible;

//==============================================================================
/** Searches the layer's sublayers for a CALayer of a specified class. */
- (CALayer*) sublayerOfClassType: (Class) classType;

/** Searches the layer's sublayers for a CALayer of a specified class. */
- (CALayer*) sublayerOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively;

@end
