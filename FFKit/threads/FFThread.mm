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

#import "FFThread.h"
#include <thread>
#include <memory>
#include <chrono>

using std::thread;
using std::auto_ptr;

@interface FFThread()
@property (nonatomic, readonly) FFThreadBlock block;
@property (nonatomic, readonly) auto_ptr<thread> t;
@end

@implementation FFThread
@synthesize block;
@synthesize t;

#pragma mark -
#pragma mark Object Lifecycle
//==============================================================================
- (id) init {
    // Use the designated initializer!
    assert (false);
    
    return nil;
}

- (id) initWithBlock: (FFThreadBlock) block_ {
    if ((self = [super init]) != nil) {
        
        // Block can't be nil!
        assert (block_ != nil);
        
        block = block_;
        
        t = auto_ptr<std::thread> (new thread ([self] () {
            self.block();
        }));
    }
    
    return self;
}

- (void) dealloc {
    
}

+ (instancetype) thread: (void (^) (void)) block_ {
    return [[FFThread alloc] initWithBlock: block_];
}

- (void) join {
    t->join();
}

- (void) detach {
    t->detach();
}

#pragma mark -
#pragma mark Static Methods
//==============================================================================
+ (void) join: (void (^) (void)) block_ {
    [[FFThread thread: block_] join];
}

+ (void) detach: (void (^) (void)) block_ {
    [[FFThread thread: block_] detach];
}

+ (void) sleep: (unsigned long long) milliseconds {
    std::this_thread::sleep_for (std::chrono::milliseconds (milliseconds));
}

@end
