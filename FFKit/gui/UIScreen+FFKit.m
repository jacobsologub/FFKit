//
//  UIScreen+FFKit.m
//  FFKit
//
//  Created by Jacob Sologub on 2/28/16.
//  Copyright (c) 2016 Jacob Sologub. All rights reserved.
//

#import "UIScreen+FFKit.h"

@implementation UIScreen (FFKit)

- (float) width {
    return self.bounds.size.width;
}

- (float) height {
    return self.bounds.size.height;
}

@end
