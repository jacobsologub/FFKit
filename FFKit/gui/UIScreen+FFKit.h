//
//  UIScreen+FFKit.h
//  FFKit
//
//  Created by Jacob Sologub on 2/28/16.
//  Copyright (c) 2016 Jacob Sologub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (FFKit)

/**	Gets the width of the screen, measured in points. (read-only)
    
    @see height
*/
@property (nonatomic, readonly) float width;

/**	Gets the height of the screen, measured in points. (read-only)
 
    @see width
*/
@property (nonatomic, readonly) float height;

@end
