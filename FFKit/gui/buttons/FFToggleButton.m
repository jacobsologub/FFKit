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
@synthesize triggerControlEvents;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    return [self initWithRenderingMode: FFButtonDefaultRenderingMode];
}

- (id) initWithRenderingMode: (FFButtonRenderingMode) renderingMode {
    if ((self = [super initWithRenderingMode: renderingMode]) != nil) {
        triggerControlEvents = UIControlEventTouchUpInside;
        [self addTarget: self action: @selector (buttonPressedInternal:) forControlEvents: triggerControlEvents];
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

#pragma mark -
#pragma mark Trigger Control Events Property
//==============================================================================
- (void) setTriggerControlEvents: (UIControlEvents) newTriggerControlEvents {
    [self removeTarget: self action: @selector (buttonPressedInternal:) forControlEvents: triggerControlEvents];
    [self addTarget: self action: @selector (buttonPressedInternal:) forControlEvents: newTriggerControlEvents];
    triggerControlEvents = newTriggerControlEvents;
}

@end
