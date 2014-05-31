//
//  NSMutableAttributedString+FFKit.h
//  FFKit
//
//  Created by Jacob Sologub on 5/30/14.
//  Copyright (c) 2014 Jacob Sologub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (FFKit)

/** Sets the NSFontAttributeName attribute for all the characters.
 
    @see NSMutableAttributedString#setFont:range
*/
- (void) setFont: (UIFont*) font;

/** Sets the NSFontAttributeName attribute for the characters in the specified 
    range.
    
    @see NSMutableAttributedString#setFont
*/
- (void) setFont: (UIFont*) font range: (NSRange) range;

/** Sets the NSForegroundColorAttributeName attribute for all the characters.
    
    @see NSMutableAttributedString#setTextColor:range
*/
- (void) setTextColor: (UIColor*) color;

/** Sets the NSForegroundColorAttributeName attribute for the characters in the 
    specified range.

    @see NSMutableAttributedString#setTextColor
*/
- (void) setTextColor: (UIColor*) color range: (NSRange) range;

/** Sets the NSParagraphStyleAttributeName attribute for all the characters.
    
    @see NSMutableAttributedString#setParagraphStyle:range
*/
- (void) setParagraphStyle: (NSParagraphStyle*) style;

/** Sets the NSParagraphStyleAttributeName attribute for the characters in the 
    specified range.
 
    @see NSMutableAttributedString#setParagraphStyle
*/
- (void) setParagraphStyle: (NSParagraphStyle*) style range: (NSRange) range;

@end
