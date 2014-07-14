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

#import "FFButton.h"
#import "UIView+FFKit.h"

FFButtonRenderingMode defaultRenderingMode = FFButtonRenderingModeLayers;

@implementation FFButton
@synthesize renderingMode;
@synthesize hitTestEdgeInsets;
@dynamic cornerRadius;
@dynamic borderWidth;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    return [self initWithRenderingMode: defaultRenderingMode];
}

- (id) initWithRenderingMode: (FFButtonRenderingMode) renderingMode_ {
    return [self initWithFrame: CGRectZero renderingMode: renderingMode_];
}

- (id) initWithFrame: (CGRect) frame {
    return [self initWithFrame: frame renderingMode: defaultRenderingMode];
}

- (id) initWithFrame: (CGRect) frame renderingMode: (FFButtonRenderingMode) renderingMode_ {
    if ((self = [super initWithFrame: frame]) != nil) {
        backgroundColorLookup = [NSMutableDictionary new];
        borderColorLookup = [NSMutableDictionary new];
        
        cornerRadius = 0.0f;
        borderWidth = 1.0f;
        
        renderingMode = renderingMode_;
        if (renderingMode == FFButtonRenderingModeLayers) {
            shapeLayer = [CAShapeLayer layer];
            shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
            shapeLayer.borderColor = [UIColor clearColor].CGColor;
            shapeLayer.borderWidth = borderWidth;
            [self.layer addSublayer: shapeLayer];
        }
    }
    
    return self;
}

- (void) dealloc {
   #if !__has_feature (objc_arc)
    [borderColorLookup release];
    [backgroundColorLookup release];
    
    [super dealloc];
   #endif
}

#pragma mark -
#pragma mark UIView Overrides
//==============================================================================
- (void) drawRect: (CGRect) rect {
    [super drawRect: rect];
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        return;
    }
    
    UIColor* color = backgroundColorLookup [@(self.state)] ?: backgroundColorLookup [@(UIControlStateNormal)];
    if (color != nil) {
        [color setFill];
        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect: CGRectInset (self.bounds, borderWidth * 0.5f, borderWidth * 0.5f) cornerRadius: cornerRadius];
        [path fill];
    }
    
    color = borderColorLookup [@(self.state)] ?: borderColorLookup [@(UIControlStateNormal)];
    if (color != nil) {
        [color setStroke];
        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect: CGRectInset (self.bounds, borderWidth * 0.5f, borderWidth * 0.5f) cornerRadius: cornerRadius];
        path.lineWidth = borderWidth;
        [path stroke];
    }
}

- (UIView*) hitTest: (CGPoint) point withEvent: (UIEvent*) event {
    if (UIEdgeInsetsEqualToEdgeInsets (hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super hitTest: point withEvent: event];
    }
    
    CGRect relativeFrame = CGRectMake (0.0f, 0.0f, self.width, self.height);
    CGRect hitFrame = UIEdgeInsetsInsetRect (relativeFrame, self.hitTestEdgeInsets);
    if (CGRectContainsPoint (hitFrame, point)) {
        return self;
    }
    
    return nil;
}

- (void) layoutSublayersOfLayer: (CALayer*) layer {
    [super layoutSublayersOfLayer: layer];
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        shapeLayer.frame = self.layer.bounds;
    }
}

#pragma mark -
#pragma mark UIControl Overrides
//==============================================================================
- (void) setHighlighted: (BOOL) highlighted {
    [super setHighlighted: highlighted];
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        UIColor* backgroundColor = backgroundColorLookup [@(self.state)] ?: backgroundColorLookup [@(UIControlStateNormal)];
        UIColor* borderColor = borderColorLookup [@(self.state)] ?: borderColorLookup [@(UIControlStateNormal)];
        shapeLayer.backgroundColor = backgroundColor != nil ? backgroundColor.CGColor : [UIColor clearColor].CGColor;
        shapeLayer.borderColor = borderColor != nil ? borderColor.CGColor : [UIColor clearColor].CGColor;
    }
    else {
        [self setNeedsDisplay];
    }
}

- (void) setSelected: (BOOL) selected {
    [super setSelected: selected];
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        UIColor* backgroundColor = backgroundColorLookup [@(self.state)] ?: backgroundColorLookup [@(UIControlStateNormal)];
        UIColor* borderColor = borderColorLookup [@(self.state)] ?: borderColorLookup [@(UIControlStateNormal)];
        shapeLayer.backgroundColor = backgroundColor != nil ? backgroundColor.CGColor : [UIColor clearColor].CGColor;
        shapeLayer.borderColor = borderColor != nil ? borderColor.CGColor : [UIColor clearColor].CGColor;
    }
    else {
        [self setNeedsDisplay];
    }
}

- (void) setEnabled: (BOOL) enabled {
    [super setEnabled: enabled];
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        UIColor* backgroundColor = backgroundColorLookup [@(self.state)] ?: backgroundColorLookup [@(UIControlStateNormal)];
        UIColor* borderColor = borderColorLookup [@(self.state)] ?: borderColorLookup [@(UIControlStateNormal)];
        shapeLayer.backgroundColor = backgroundColor != nil ? backgroundColor.CGColor : [UIColor clearColor].CGColor;
        shapeLayer.borderColor = borderColor != nil ? borderColor.CGColor : [UIColor clearColor].CGColor;
    }
    else {
        [self setNeedsDisplay];
    }
}

#pragma mark -
#pragma mark Colors
//==============================================================================
- (void) setBackgroundColor: (UIColor*) color forState: (UIControlState) state {
    backgroundColorLookup [@(state)] = color;
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        UIColor* backgroundColor = backgroundColorLookup [@(self.state)] ?: backgroundColorLookup [@(UIControlStateNormal)];
        shapeLayer.backgroundColor = backgroundColor != nil ? backgroundColor.CGColor : [UIColor clearColor].CGColor;
    }
    else {
        [self setNeedsDisplay];
    }
}

- (UIColor*) backgroundColorForState: (UIControlState) state {
    return backgroundColorLookup [@(state)];
}

- (void) setBorderColor: (UIColor*) color forState: (UIControlState) state {
    borderColorLookup [@(state)] = color;
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        UIColor* borderColor = borderColorLookup [@(self.state)] ?: borderColorLookup [@(UIControlStateNormal)];
        shapeLayer.borderColor = borderColor != nil ? borderColor.CGColor : [UIColor clearColor].CGColor;
    }
    else {
        [self setNeedsDisplay];
    }
}

- (UIColor*) borderColorForState: (UIControlState) state {
    return borderColorLookup [@(state)];
}

- (void) setBackgroundAndBorderColor: (UIColor*) color forState: (UIControlState) state {
    [self setBackgroundColor: color forState: state];
    [self setBorderColor: color forState: state];
}

#pragma mark -
#pragma mark Corner Radius / Border Width
//==============================================================================
- (void) setCornerRadius: (CGFloat) newCornerRadius {
    cornerRadius = newCornerRadius;
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        shapeLayer.cornerRadius = cornerRadius;
    }
    else {
        [self setNeedsDisplay];
    }
}

- (void) setBorderWidth: (CGFloat) newBorderWidth {
    borderWidth = newBorderWidth;
    
    if (renderingMode == FFButtonRenderingModeLayers) {
        shapeLayer.borderWidth = borderWidth;
    }
    else {
        [self setNeedsDisplay];
    }
}

#pragma mark -
#pragma mark Default Rendering Mode
//==============================================================================
+ (void) setDefaultRenderingMode: (FFButtonRenderingMode) newDefaultRenderingMode {
    defaultRenderingMode = newDefaultRenderingMode;
}

+ (FFButtonRenderingMode) defaultRenderingMode {
    return defaultRenderingMode;
}

@end
