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

static inline void dispatchAfterDelayWithQueue (double delayInSeconds, dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_time_t popTime = dispatch_time (DISPATCH_TIME_NOW, (int64_t) (delayInSeconds * NSEC_PER_SEC));
    dispatch_after (popTime, queue, block);
}

static inline void dispatchAfterDelay (double delayInSeconds, dispatch_block_t block) {
    dispatchAfterDelayWithQueue (delayInSeconds, dispatch_get_main_queue(), block);
}

static inline void dispatchAsync (dispatch_block_t block) {
    dispatch_async (dispatch_get_main_queue(), block);
}

static inline void dispatchAsyncChecked (dispatch_block_t block) {
    const BOOL isMainThread = [NSThread isMainThread];
    if (!isMainThread) {
        dispatch_async (dispatch_get_main_queue(), block);
    }
    else {
        block();
    }
}

static inline dispatch_source_t dispatchAsyncTimerWithLeewayAndQueue (NSTimeInterval interval, NSTimeInterval leeway, dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_source_t timer = dispatch_source_create (DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer (timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, leeway * NSEC_PER_SEC);
    dispatch_source_set_event_handler (timer, ^{
        block();
    });
    
    dispatch_resume (timer);
    return timer;
}

static inline dispatch_source_t dispatchAsyncTimerWithLeeway (NSTimeInterval interval, NSTimeInterval leeway, dispatch_block_t block) {
    return dispatchAsyncTimerWithLeewayAndQueue (interval, leeway, dispatch_get_main_queue(), block);
}

static inline dispatch_source_t dispatchAsyncTimerWithQueue (NSTimeInterval interval, dispatch_queue_t queue, dispatch_block_t block) {
    return dispatchAsyncTimerWithLeewayAndQueue (interval, MIN (interval * 1.5, 1.0), queue, block);
}

static inline dispatch_source_t dispatchAsyncTimer (NSTimeInterval interval, dispatch_block_t block) {
    return dispatchAsyncTimerWithLeewayAndQueue (interval, MIN (interval * 1.5, 1.0), dispatch_get_main_queue(), block);
}
