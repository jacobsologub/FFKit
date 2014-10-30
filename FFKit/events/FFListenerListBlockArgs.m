//
//  FFListenerListBlockArgs.m
//  FFKit
//
//  Created by Jacob Sologub on 10/30/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import "FFListenerListBlockArgs.h"

@implementation FFListenerListBlockArgs
@synthesize object1;
@synthesize object2;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    return [self initWithObject: nil];
}

- (id) initWithObject: (id) object {
    return [self initWithObject: object object: nil];
}

- (id) initWithObject: (id) object1_ object: (id) object2_ {
    if ((self = [super init]) != nil) {
        object1 = object1_;
        object2 = object2_;
    }
    
    return self;
}

- (void) dealloc {
    
}

@end
