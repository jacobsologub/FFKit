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

#import "UIAlertView+FFKit.h"
#import <objc/runtime.h>

static char kUIAlertViewBlockKey;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation UIAlertView (FFKit)

- (void) showWithBlock: (UIAlertViewClickedButtonAtIndexBlock) block {
    objc_setAssociatedObject (self, &kUIAlertViewBlockKey, block, OBJC_ASSOCIATION_COPY);
    
    // If you are assigning a delegate then you shouldn't be calling this
    // method!
    assert (self.delegate == nil);
    self.delegate = (id <UIAlertViewDelegate>) self;
    
    [self show];
}

- (void) alertView: (UIAlertView*) alertView clickedButtonAtIndex: (NSInteger) buttonIndex {
    UIAlertViewClickedButtonAtIndexBlock block = objc_getAssociatedObject (self, &kUIAlertViewBlockKey);
    block (self, buttonIndex);
    
    objc_setAssociatedObject (self, &kUIAlertViewBlockKey, nil, OBJC_ASSOCIATION_COPY);
}

@end

#pragma clang diagnostic pop
