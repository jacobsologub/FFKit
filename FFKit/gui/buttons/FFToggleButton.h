//
//  FFToggleButton.h
//  FFKit
//
//  Created by Jacob Sologub on 7/13/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import "FFButton.h"

@interface FFToggleButton : FFButton {
@private
    UIControlEvents triggerControlEvents;
}

/** Creates a FFButton with the specified rendering mode. The default rendering
    mode is FFButtonRenderingModeLayers.
*/
- (id) initWithRenderingMode: (FFButtonRenderingMode) renderingMode;

/** Gets or sets the UIControlEvents that should trigger the toggle. Defaults to 
    UIControlEventTouchUpInside.
 
    @see UIControlEvents
*/
@property (nonatomic, assign) UIControlEvents triggerControlEvents;

@end
