//
//  UIImageView+EXKit.m
//  EXKit
//
//  Created by Jacob Sologub on 5/27/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import "UIImageView+EXKit.h"

@implementation UIImageView (EXKit)

- (id) initWithImageNamed: (NSString*) name {
    return [self initWithImage: [UIImage imageNamed: name]];
}

- (id) initWithImageNamed: (NSString*) name1 highlightedImageNamed: (NSString*) name2 {
    return [self initWithImage: [UIImage imageNamed: name1] highlightedImage: [UIImage imageNamed: name2]];
}

@end
