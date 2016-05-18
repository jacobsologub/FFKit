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
@property (nonatomic, readonly) CGFloat width;

/**	Gets the height of the screen, measured in points. (read-only)
 
    @see width
*/
@property (nonatomic, readonly) CGFloat height;

@end
