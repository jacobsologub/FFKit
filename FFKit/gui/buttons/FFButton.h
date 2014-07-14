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

/** FFButtonRenderingMode
    Specifies the possible rendering modes for an FFButon.
*/
typedef NS_ENUM (NSUInteger, FFButtonRenderingMode) {
    FFButtonRenderingModeLayer = 0,
    FFButtonRenderingModeDraw,
};

extern FFButtonRenderingMode FFButtonDefaultRenderingMode;

@interface FFButton : UIButton {
@private
    NSMutableDictionary* backgroundColorLookup;
    NSMutableDictionary* borderColorLookup;
    
    CGFloat cornerRadius;
    CGFloat borderWidth;
    
    CAShapeLayer* shapeLayer;
    
    FFButtonRenderingMode renderingMode;
    
    UIEdgeInsets hitTestEdgeInsets;
}

/** Creates an FFButton with the specified rendering mode. The default rendering 
    mode is FFButtonRenderingModeLayers.
 
    @see FFButtonRenderingMode, initWithFrame:renderingMode
*/
- (id) initWithRenderingMode: (FFButtonRenderingMode) renderingMode;

/** Creates an FFButton with the specified frame and rendering mode. The default 
    rendering mode is FFButtonRenderingModeLayers.
 
    @see FFButtonRenderingMode, initWithRenderingMode
*/
- (id) initWithFrame: (CGRect) frame renderingMode: (FFButtonRenderingMode) renderingMode;

/** Returns the button's current rendering mode. Readonly.
 
    @see initWithRenderingMode
 */
@property (nonatomic, readonly) FFButtonRenderingMode renderingMode;

/** Adjusts the button's hit area. */
@property (nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

/** The radius to use when drawing the buttons’s background and border. 
    
    @see borderWidth
*/
@property (nonatomic, assign) CGFloat cornerRadius;

/** The width of the button’s border. 
 
    @see setBorderColor:forState
*/
@property (nonatomic, assign) CGFloat borderWidth;

/** Sets the background color to use for the specified button state.
 
    @see backgroundColorForState
*/
- (void) setBackgroundColor: (UIColor*) color forState: (UIControlState) state;

/** Returns the background color used for a button state.
    
    @see setBackgroundColor:forState
*/
- (UIColor*) backgroundColorForState: (UIControlState) state;

/** Sets the border color to use for the specified button state.
    
    @see borderColorForState
*/
- (void) setBorderColor: (UIColor*) color forState: (UIControlState) state;

/** Sets the border color to use for the specified button state.
    
    @see setBorderColor:forState
*/
- (UIColor*) borderColorForState: (UIControlState) state;

/** Sets the background and border colors to use for the specified button state.
 
    @see setBackgroundColor:forState, @see setBorderColor:forState
*/
- (void) setBackgroundAndBorderColor: (UIColor*) color forState: (UIControlState) state;

/** Sets the default rendering mode for the FFButton class.
 
    @see defaultRenderingMode
*/
+ (void) setDefaultRenderingMode: (FFButtonRenderingMode) renderingMode;

/** Returns the default rendering mode for the FFButton class.
 
    @see defaultRenderingMode
*/
+ (FFButtonRenderingMode) defaultRenderingMode;
@end
