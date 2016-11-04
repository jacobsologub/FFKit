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

#import "UIApplication+FFKit.h"
#import "NSBundle+FFKit.h"

const NSString* const kFFAppleLookupUrl = @"http://itunes.apple.com/lookup";

@implementation UIApplication (FFKit)

+ (void) checkVersionForAppleId: (NSUInteger) appleId block: (void (^) (NSError* error, NSDictionary* appInfo, BOOL updateAvailable)) block {
    NSURL* const url = [NSURL URLWithString: [NSString stringWithFormat: @"%@?id=%d", kFFAppleLookupUrl, (int) appleId]];
    NSURLRequest* const request = [NSURLRequest requestWithURL: url];
    
    [NSURLConnection sendAsynchronousRequest: request
        queue: [NSOperationQueue mainQueue]
        completionHandler: ^(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError) {
            if (!connectionError) {
                NSError* error = nil;
                NSDictionary* const object = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableLeaves error: &error];
                
                if (error) {
                    block (error, nil, NO);
                }
                else {
                    NSArray* const results = [object objectForKey: @"results"];
                    if (results.count > 0) {
                        NSDictionary* const jsonData = results.firstObject;
                        
                        NSString* const thisVersion = [NSBundle version];
                        NSString* const thatVersion = [jsonData objectForKey: @"version"];
                        
                        const BOOL hasUpdate = [self compareVersions: thisVersion version2: thatVersion] == NSOrderedAscending;
                        block (nil, jsonData, hasUpdate);
                    }
                    else {
                        NSDictionary* const userInfo = @{
                            NSLocalizedFailureReasonErrorKey: @"Apple ID info not found."
                        };
                        
                        NSError* const error = [NSError errorWithDomain: @"FFKit.UIApplication.checkVersionForAppId" code: -9191 userInfo: userInfo];
                        block (error, nil, NO);
                    }
                }
            }
            else {
                block (connectionError, nil, NO);
            }
        }
    ];
}

+ (NSComparisonResult) compareVersions: (NSString*) version1 version2: (NSString*) version2 {
    NSComparisonResult result = NSOrderedSame;
    
    NSMutableArray* a = [(NSMutableArray*) [version1 componentsSeparatedByString: @"."] mutableCopy];
    NSMutableArray* b = [(NSMutableArray*) [version2 componentsSeparatedByString: @"."] mutableCopy];
    
    while (a.count < b.count) { [a addObject: @"0"]; }
    while (b.count < a.count) { [b addObject: @"0"]; }
    
    for (int i = 0; i < a.count; ++i) {
        if ([a [i] integerValue] < [b [i] integerValue]) {
            result = NSOrderedAscending;
            break;
        }
        else if ([b [i] integerValue] < [a [i] integerValue]) {
            result = NSOrderedDescending;
            break;
        }
    }
    
    return result;
}

@end
