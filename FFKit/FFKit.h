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

#ifdef __OBJC__
    #import "application/NSBundle+FFKit.h"
    #import "core/NSObject+FFKit.h"
    #import "core/containers/NSArray+FFKit.h"
    #import "core/containers/NSDictionary+FFKit.h"
    #import "core/containers/NSIndexPath+FFKit.h"
    #import "core/containers/NSJSONSerialization+FFKit.h"
    #import "core/containers/NSMutableArray+FFKit.h"
    #import "core/gcd/GCD+FFKit.h"
    #import "core/text/NSAttributedString+FFKit.h"
    #import "core/text/NSMutableAttributedString+FFKit.h"
    #import "core/text/NSString+FFKit.h"
    #import "core/text/NSURL+FFKit.h"

    #import "events/FFListenerList.h"
    #import "events/FFListenerListBlockArgs.h"

    #import "graphics/color/UIColor+FFKit.h"
    #import "graphics/geometry/CGPoint+FFKit.h"
    #import "graphics/geometry/CGRect+FFKit.h"
    #import "graphics/geometry/CGSize+FFKit.h"
    #import "graphics/geometry/UIEdgeInsets+FFKit.h"
    #import "graphics/image/UIImage+FFKit.h"

    #import "gui/UIScreen+FFKit.h"
    #import "gui/buttons/FFButton.h"
    #import "gui/buttons/FFToggleButton.h"
    #import "gui/buttons/UIBarButtonItem+FFKit.h"
    #import "gui/buttons/UIControl+FFKit.h"
    #import "gui/labels/UILabel+FFKit.h"
    #import "gui/layers/CALayer+FFKit.h"
    #import "gui/navigation/UINavigationController+FFKit.h"
    #import "gui/views/UIActionSheet+FFKit.h"
    #import "gui/views/UIAlertView+FFKit.h"
    #import "gui/views/UIImageView+FFKit.h"
    #import "gui/views/UIView+FFKit.h"
#endif

#if __cplusplus
    #import "events/ListenerList.h"
#endif