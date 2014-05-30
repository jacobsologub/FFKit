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

#import "UIActionSheet+FFKit.h"
#import <objc/runtime.h>

static char kUIActionSheetBlockKey;

@implementation UIActionSheet (FFKit)

- (void) showInView: (UIView*) view block: (UIActionSheetClickedButtonAtIndexBlock) block {
    objc_setAssociatedObject (self, &kUIActionSheetBlockKey, block, OBJC_ASSOCIATION_COPY);
    
    // If you are assigning a delegate then you shouldn't be calling this
    // method!
    assert (self.delegate == nil);
    self.delegate = (id <UIActionSheetDelegate>) self;
    
    [self showInView: view];
}

- (void) actionSheet: (UIActionSheet*) actionSheet clickedButtonAtIndex: (NSInteger) buttonIndex {
    UIActionSheetClickedButtonAtIndexBlock block = objc_getAssociatedObject (self, &kUIActionSheetBlockKey);
    block (self, buttonIndex);
    
    objc_setAssociatedObject (self, &kUIActionSheetBlockKey, nil, OBJC_ASSOCIATION_COPY);
}

@end
