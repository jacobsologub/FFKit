//
//  UIImageView+EXKit.h
//  EXKit
//
//  Created by Jacob Sologub on 5/27/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (EXKit)

/** Returns an image view initialized with the specified image filename.
    
    @see UIImage#imageNamed
*/
- (id) initWithImageNamed: (NSString*) name;

/** Returns an image view initialized with the specified regular and highlighted 
    images.
 
    @see UIImage#imageNamed
*/
- (id) initWithImageNamed: (NSString*) name highlightedImageNamed: (NSString*) name;

@end
