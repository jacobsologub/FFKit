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

#import <UIKit/UIKit.h>

@interface UIView (FFKit)

/**	Returns the x coordinate of the view's left edge. */
@property (nonatomic, readonly) float x;

/**	Returns the y coordinate of the view's top edge. */
@property (nonatomic, readonly) float y;

/**	Returns the width of the view. */
@property (nonatomic, readonly) float width;

/**	Returns the height of the view. */
@property (nonatomic, readonly) float height;

/**	Returns the x coordinate of the view's right edge. */
@property (nonatomic, readonly) float right;

/**	Returns the y coordinate of the view's bottom edge. */
@property (nonatomic, readonly) float bottom;

/** Changes the view's size and centres it within its superview. */
- (void) centerWithSize: (CGSize) newSize;

/**	Gets or sets whether or not the view is visible. */
@property (nonatomic, assign) BOOL visible;

//==============================================================================
/** Searches the view's subviews for a UIView of a specified class. */
- (UIView*) subviewOfClassType: (Class) classType;

/** Searches the view's subviews for a UIView of a specified class. */
- (UIView*) subviewOfClassType: (Class) classType searchRecursively: (BOOL) searchRecursively;

/** Searches the view's superviews for a UIView of a specified class. */
- (UIView*) superviewOfClassType: (Class) classType;

/** Returns the superview whose tag matches the specified value. */
- (UIView*) superviewWithTag: (NSInteger) tag;

//==============================================================================
/** Generates an image of this view and its its subviews. */
- (UIImage*) snapshotImage;

/** Generates an image of this view and its its subviews with the specified 
    options.
*/
- (UIImage*) snapshotImageWithOptions: (BOOL) opaque scale: (CGFloat) scale __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);

@end
