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

#import "UINavigationController+FFKit.h"
#import "NSArray+FFKit.h"

@implementation UINavigationController (FFKit)

- (UIViewController*) viewControllerOfClassType: (Class) classType {
    return [self viewControllerOfClassType: classType inRange: NSMakeRange (0, self.viewControllers.count)];
}

- (UIViewController*) viewControllerOfClassType: (Class) classType inRange: (NSRange) range {
    UIViewController* result = nil;
    const NSUInteger index = [self.viewControllers indexOfObjectOfClassType: classType inRange: range];
    if (index != NSNotFound) {
        result = self.viewControllers [index];
    }
    
    return result;
}

- (NSArray*) popToViewControllerOfClassType: (Class) classType animated: (BOOL) animated {
    return [self popToViewControllerOfClassType: classType animated: animated dismissPresentedViewControllers: NO];
}

- (NSArray*) popToViewControllerOfClassType: (Class) classType animated: (BOOL) animated dismissPresentedViewControllers: (BOOL) dismissPresentedViewControllers {
    NSArray* result = nil;
    const NSUInteger viewControllerCount = [self.viewControllers count];
    
    if (viewControllerCount > 1) {
        NSUInteger indexToPopTo = [self.viewControllers indexOfObjectWithOptions: NSEnumerationReverse passingTest: ^BOOL (id obj, NSUInteger idx, BOOL* stop) {
            if ([obj isKindOfClass: classType]) {
                *stop = YES;
                return YES;
            }
            
            return NO;
        }];
        
        if (indexToPopTo == NSNotFound) {
            return nil;
        }
        
        if (dismissPresentedViewControllers) {
            for (int i = (int) viewControllerCount; --i > (int) indexToPopTo;) {
                UIViewController* viewController = self.viewControllers [i];
                if (viewController.presentedViewController != nil) {
                    [viewController dismissViewControllerAnimated: NO completion: nil];
                }
            }
        }
        
        result = [self popToViewController: self.viewControllers [indexToPopTo] animated: animated];
    }
    
    return result;
}

@end
