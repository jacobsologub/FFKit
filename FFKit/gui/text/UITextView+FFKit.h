/*
  ==============================================================================
 
   Copyright (C) 2016 Jacob Sologub

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

#import <UIKit/UIKit.h>

@interface UITextView (FFKit)

NS_ASSUME_NONNULL_BEGIN

/**	Adds a UITextViewTextDidBeginEditingNotification observer for this text 
    view.
 
    @see UITextViewTextDidBeginEditingNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) addTextDidBeginEditingNotificationObserver: (id) observer selector: (SEL) selector;

/**	Removes a UITextViewTextDidBeginEditingNotification observer for this text
    view.
 
    @see UITextViewTextDidBeginEditingNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) removeTextDidBeginEditingNotificationObserver: (id) observer selector: (nonnull SEL) selector;

/**	Adds a UITextViewTextDidChangeNotification observer for this text view.
 
    @see UITextViewTextDidChangeNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) addTextDidChangeNotificationObserver: (id) observer selector: (SEL) selector;

/**	Removes a UITextViewTextDidChangeNotification observer for this text view.
 
    @see UITextViewTextDidChangeNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) removeTextDidChangeNotificationObserver: (id) observer selector: (nonnull SEL) selector;

/**	Adds a UITextViewTextDidEndEditingNotification observer for this text view.
 
    @see UITextViewTextDidEndEditingNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) addTextDidEndEditingNotificationObserver: (id) observer selector: (SEL) selector;

/**	Removes a UITextViewTextDidEndEditingNotification observer for this text 
    view.
 
    @see UITextViewTextDidEndEditingNotification, NSNotificationCenter#addObserver:selector:name:object
*/
- (void) removeTextDidEndEditingNotificationObserver: (id) observer selector: (nonnull SEL) selector;

NS_ASSUME_NONNULL_END

@end
