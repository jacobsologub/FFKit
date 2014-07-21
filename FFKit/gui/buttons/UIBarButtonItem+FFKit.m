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

#import "UIBarButtonItem+FFKit.h"

@implementation UIBarButtonItem (FFKit)

+ (UIBarButtonItem*) barButtonItemWithImage: (UIImage*) image target: (id) target action: (SEL) action {
    return [self barButtonItemWithImage: image style: UIBarButtonItemStylePlain target: target action: action];
}

+ (UIBarButtonItem*) barButtonItemWithImage: (UIImage*) image style: (UIBarButtonItemStyle) style target: (id) target action: (SEL) action {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithImage: image style: style target: target action: action];
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

+ (UIBarButtonItem*) barButtonItemWithTitle: (NSString*) title target: (id) target action: (SEL) action {
    return [self barButtonItemWithTitle: title style: UIBarButtonItemStylePlain target: target action: action];
}

+ (UIBarButtonItem*) barButtonItemWithTitle: (NSString*) title style: (UIBarButtonItemStyle) style target: (id) target action: (SEL) action {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithTitle: title style: style target: target action: action];
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

+ (UIBarButtonItem*) barButtonItemWithBarButtonSystemItem: (UIBarButtonSystemItem) systemItem target: (id) target action: (SEL) action {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: systemItem target: target action: action];
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

+ (UIBarButtonItem*) barButtonSystemItemFixedSpace {
    return [self barButtonSystemItemFixedSpaceWithWidth: 0.0f];
}

+ (UIBarButtonItem*) barButtonSystemItemFixedSpaceWithWidth: (CGFloat) width {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace target: nil action: nil];
    result.width = width;
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

+ (UIBarButtonItem*) barButtonSystemItemFlexibleSpace {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: nil];
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

+ (UIBarButtonItem*) barButtonItemWithCustomView: (UIView*) customView {
    UIBarButtonItem* result = [[UIBarButtonItem alloc] initWithCustomView: customView];
    
   #if !__has_feature (objc_arc)
    return [result autorelease];
   #else
    return result;
   #endif
}

@end
