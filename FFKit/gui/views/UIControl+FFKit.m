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

#import "UIControl+FFKit.h"
#import "NSObject+FFKit.h"
#import "FFAssociatedObject.h"
#import "FFListenerList.h"

@interface FFControlTarget : NSObject
@property (nonatomic, weak) FFListenerList* listenerList;
@property (nonatomic, assign) UIControlEvents controlEvents;
- (void) handleControlEvent: (UIControl*) control;
@end

@implementation FFControlTarget
@synthesize listenerList;
@synthesize controlEvents;

- (void) dealloc {
    // xx
}

- (void) handleControlEvent: (UIControl*) control {
    [listenerList callWithObject: control withObject: @(controlEvents)];
}
@end

@implementation UIControl (FFKit)

- (void) addUIControlEventTouchUpInsideTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
}

- (void) removeUIControlEventTouchUpInsideTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
}

- (void) addUIControlEventValueChangedTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventValueChanged];
}

- (void) removeUIControlEventValueChangedTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventValueChanged];
}

- (void) addUIControlEventEditingDidBeginTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventEditingDidBegin];
}

- (void) removeUIControlEventEditingDidBeginTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventEditingDidBegin];
}

- (void) addUIControlEventEditingChangedTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventEditingChanged];
}

- (void) removeUIControlEventEditingChangedTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventEditingChanged];
}

- (void) addUIControlEventEditingDidEndTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventEditingDidEnd];
}

- (void) removeUIControlEventEditingDidEndTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventEditingDidEnd];
}

- (void) addUIControlEventEditingDidEndOnExitTarget: (id) target action: (SEL) action {
    [self addTarget: target action: action forControlEvents: UIControlEventEditingDidEndOnExit];
}

- (void) removeUIControlEventEditingDidEndOnExitTarget: (id) target action: (SEL) action {
    [self removeTarget: target action: action forControlEvents: UIControlEventEditingDidEndOnExit];
}

- (void) addTarget: (FFListenerListBlock) block forControlEvents: (UIControlEvents) controlEvents {
    NSString* controlListenerListKey = [NSString stringWithFormat: @"kFFKitControlListenerListKey:UIControlEvents=%u", (unsigned int) controlEvents];
    FFListenerList* listenerList = [self getOrCreateAssociatedObjectForKey: controlListenerListKey type: [FFListenerList class]];
    [listenerList addTarget: block];
    
    NSString* controlTargetKey = [NSString stringWithFormat: @"kFFKitControlTargetKey:UIControlEvents=%u", (unsigned int) controlEvents];
    FFControlTarget* controlTarget = [self getOrCreateAssociatedObjectForKey: controlTargetKey type: [FFControlTarget class]];
    controlTarget.listenerList = listenerList;
    controlTarget.controlEvents = controlEvents;
    [self addTarget: controlTarget action: @selector (handleControlEvent:) forControlEvents: controlEvents];
}

- (void) removeTarget: (FFListenerListBlock) block forControlEvents: (UIControlEvents) controlEvents {
    NSString* controlListenerListKey = [NSString stringWithFormat: @"kFFKitControlListenerListKey:UIControlEvents=%u", (unsigned int) controlEvents];
    FFListenerList* listenerList = [self getOrCreateAssociatedObjectForKey: controlListenerListKey type: [FFListenerList class]];
    [listenerList removeTarget: block];
    
    NSString* controlTargetKey = [NSString stringWithFormat: @"kFFKitControlTargetKey:UIControlEvents=%u", (unsigned int) controlEvents];
    [self setAssociatedObject: nil forKey: controlTargetKey];
}

@end
