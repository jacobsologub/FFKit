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

#import <Foundation/Foundation.h>

@interface NSString (EXKit)

/** Returns a new string made by removing from both ends of the receiver
    whitespace characters space (U+0020) and tab (U+0009).
*/
- (NSString*) stringByTrimmingWhitespaceCharacterSet;

/** Returns a new string made by removing from both ends of the receiver
    whitespace characters space (U+0020) and tab (U+0009) and the newline and
    nextline characters (U+000A–U+000D, U+0085).
*/
- (NSString*) stringByTrimmingWhitespaceAndNewlineCharacterSet;

/** Returns a new string made by removing from both ends of the receiver
    whitespace characters space (U+0020) and tab (U+0009) and the newline and
    nextline characters (U+000A–U+000D, U+0085).
*/
- (NSString*) trim;

/** Tests to see as to whether this string might be a valid email address. */
- (BOOL) isEmailAddress;

@end
