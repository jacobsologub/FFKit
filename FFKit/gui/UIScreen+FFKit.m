//
//  UIScreen+FFKit.m
//  FFKit
//
//  Created by Jacob Sologub on 2/28/16.
//  Copyright (c) 2016 Jacob Sologub. All rights reserved.
//

#import "UIScreen+FFKit.h"

@implementation UIScreen (FFKit)

- (CGFloat) width {
    return self.bounds.size.width;
}

- (CGFloat) height {
    return self.bounds.size.height;
}

@end
