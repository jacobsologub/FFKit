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

#import <QuartzCore/QuartzCore.h>

//==============================================================================
/**	CAShadow struct
 
    A structure that contains all available CALayer properties to represent a 
    shadow.
 */
struct CAShadow
{
	CGFloat shadowOpacity;
	CGFloat shadowRadius;
	CGSize shadowOffset;
	CGColorRef shadowColor;
    CGPathRef shadowPath;
};
typedef struct CAShadow CAShadow;

/**	Returns a CAShadow with the specified CALayer values. */
CA_INLINE CAShadow CAShadowMake (CGFloat shadowOpacity, CGFloat shadowRadius, CGSize shadowOffset, CGColorRef shadowColor, CGPathRef shadowPath) {
	CAShadow shadow = { shadowOpacity, shadowRadius, shadowOffset,  shadowColor, shadowPath };
	return shadow;
}

/**	A CAShadow constant with shadowOpacity equal to 0.0f, shadowRadius
    equal to 0.0f shadowOffset equal to 0.0f shadowColor equal to NULL and a
    shadowPath equal to NULL.
*/
extern const CAShadow CAShadowZero;

@interface CALayer (FFKit)

/** Gets or sets the CAShadow struct for this layer*/
@property (nonatomic, assign) CAShadow shadow;

//==============================================================================
/**	Gets or sets the x coordinate of the view.
 
    @see setX:adjustingWidth
 */
@property (nonatomic, assign) CGFloat x;

/** Sets the x coordinate of the view.
 
    @param adjustWidth      Whether or not to adjust the width of the view. If 
                            this is set to YES then the right edge of the view 
                            will remain the same.
 
    @see setX
*/
- (void) setX: (CGFloat) newX adjustingWidth: (BOOL) adjustWidth;

/**	Gets or sets the y coordinate of the view.
    
    @see setY:adjustingHeight
*/
@property (nonatomic, assign) CGFloat y;

/** Sets the y coordinate of the view.
 
    @param adjustHeight     Whether or not to adjust the height of the view. If 
                            this is set to YES then the bottom edge of the view 
                            will remain the same.
 
    @see setY
*/
- (void) setY: (CGFloat) newY adjustingHeight: (BOOL) adjustHeight;

/**	Gets or sets the width of the view. 
    
    @see setHeight
*/
@property (nonatomic, assign) CGFloat width;

/**	Gets or sets the height of the view. 
 
    @see setWidth
*/
@property (nonatomic, assign) CGFloat height;

/**	Gets or sets the size of the view.
 
    @see setWidth, setHeight
*/
@property (nonatomic, assign) CGSize size;

/**	Gets or sets the x coordinate of the view's right edge. 
    
    @see setRight:adjustingWidth
*/
@property (nonatomic, assign) CGFloat right;

/** Sets the x coordinate of the view's right edge.
 
    @param adjustWidth      Whether or not to adjust the width of the view. If
                            this is set to YES then the left edge of the view
                            will remain the same.
 
    @see setRight
*/
- (void) setRight: (CGFloat) newRight adjustingWidth: (BOOL) adjustWidth;

/**	Gets or sets the y coordinate of the view's bottom edge.
    
    @see setBottom:adjustingHeight
*/
@property (nonatomic, assign) CGFloat bottom;

/** Sets the y coordinate of the view's bottom edge.
 
    @param adjustHeight     Whether or not to adjust the height of the view. If
                            this is set to YES then the top edge of the view
                            will remain the same.
 
    @see setBottom
*/
- (void) setBottom: (CGFloat) newBottom adjustingHeight: (BOOL) adjustHeight;

/** Changes the layer's size and centres it within its superlayer. */
- (void) centerWithSize: (CGSize) newSize;

/** Changes the view's size and centres it within its superview with an optional
    block paramter that you can use to modify the final centered frame.
*/
- (void) centerWithSize: (CGSize) newSize block: (void (^) (CGRect* frame)) block;

/**	Gets or sets whether or not the layer is visible. */
@property (nonatomic, assign) BOOL visible;

//==============================================================================
/** Searches the layer's sublayers for a CALayer of a specified class. */
- (CALayer*) sublayerOfClassType: (Class) classType;

/** Searches the layer's sublayers for a CALayer of a specified class. */
- (CALayer*) sublayerOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively;

//==============================================================================
/** Disables the layer's -actionForKey: method that is used to find an action 
    (aka. implicit animation) for each layer property change. 
*/
+ (void) performWithDisabledActions: (void (^) (void)) disabledActions;
@end
