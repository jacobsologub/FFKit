//
//  FFToggleButton.m
//  FFKit
//
//  Created by Jacob Sologub on 7/13/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import "FFToggleButton.h"
#import "UIControl+FFKit.h"

@implementation FFToggleButton

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    return [self initWithRenderingMode: FFButtonRenderingModeLayers];
}

- (id) initWithRenderingMode: (FFButtonRenderingMode) renderingMode {
    if ((self = [super initWithRenderingMode: renderingMode]) != nil) {
        [self addUIControlEventTouchUpInsideTarget: self action: @selector (buttonPressedInternal:)];
    }
    
    return self;
}

- (void) dealloc {
   #if !__has_feature (objc_arc)
    [super dealloc];
   #endif
}

#pragma mark -
#pragma mark Button UIControlEventTouchUpInside Target
//==============================================================================
- (void) buttonPressedInternal: (UIButton*) button {
    self.selected = !self.selected;
}

@end
