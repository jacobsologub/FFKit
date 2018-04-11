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

#pragma once

#import <Foundation/Foundation.h>

typedef void (^FFThreadBlock) (void);

/** FFThread class
 
    A basic objc wrapper around std::thread.
    
    Example usage:
    @code
 
    FFThread* const t = [FFThread thread: ^{
        NSArray<NSString*>* const sites = @[
            @"http://www.nytimes.com/",
            @"https://upload.wikimedia.org/wikipedia/commons/4/43/Very_Large_Array,_2012.jpg",
            @"http://www.apple.com/",
            @"https://upload.wikimedia.org/wikipedia/commons/4/4e/Pleiades_large.jpg",
        ];
        
        NSMutableArray<FFThread*>* const threads = [NSMutableArray new];
        
        for (int i = 0; i < sites.count; ++i) {
            
            FFThread* const t = [FFThread thread: ^{
                NSURL* const url = [NSURL URLWithString: sites [i]];
                NSURLRequest* const request = [NSURLRequest requestWithURL: url];
                
                NSURLResponse* response = nil;
                NSError* error = nil;
                NSData* const responseData = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
                (void) responseData;
            }];
            
            [threads addObject: t];
        }
        
        [threads makeObjectsPerformSelector: @selector (join)];
        
        // or
        
        // [threads enumerateObjectsUsingBlock: ^(FFThread* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
        //     [obj join];
        // }];
    }];
    
    [t detach];
 
    @endcode
 
*/
@interface FFThread : NSObject {
@private
    FFThreadBlock block;
}

/** Creates a thread object with a specified block.
 
    @see FFThreadBlock
*/
+ (instancetype) thread: (FFThreadBlock) block;

/** Blocks the current thread until the thread identified by *this finishes 
    its execution.
 
    @see FFThread#detach
*/
- (void) join;

/** Separates the thread of execution from the thread object, allowing 
    execution to continue independently.
 
    @see FFThread#join
*/
- (void) detach;

/** Creates a thread object with a specified block, and blocks the current 
    thread until the thread identified by *this finishes its execution.
 
    @see FFThread#detach
*/
+ (void) join: (FFThreadBlock) block;

/** Creates a thread object with a specified block, and separates the thread of 
    execution from the thread object, allowing execution to continue 
    independently.
 
    @see FFThread#join
*/
+ (void) detach: (FFThreadBlock) block;

/** Blocks the execution of the current thread for at least the specified 
    sleep_duration. This function may block for longer than sleep_duration due 
    to scheduling or resource contention delays.
*/
+ (void) sleep: (unsigned long long) milliseconds;

@end
