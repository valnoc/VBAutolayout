//
//    The MIT License (MIT)
//
//    Copyright (c) 2015 Valeriy Bezuglyy.
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

#import <UIKit/UIKit.h>

#define VBAutolayoutAttributeTop        @"VBAutolayoutAttributeTop"
#define VBAutolayoutAttributeBottom     @"VBAutolayoutAttributeBottom"
#define VBAutolayoutAttributeLeading    @"VBAutolayoutAttributeLeading"
#define VBAutolayoutAttributeTrailing   @"VBAutolayoutAttributeTrailing"

#define VBAutolayoutAttributeWidth      @"VBAutolayoutAttributeWidth"
#define VBAutolayoutAttributeHeight     @"VBAutolayoutAttributeHeight"

#define VBAutolayoutAttributeCenterX    @"VBAutolayoutAttributeCenterX"
#define VBAutolayoutAttributeCenterY    @"VBAutolayoutAttributeCenterY"

#define VBAutolayoutItem        @"VBAutolayoutItem"
#define VBAutolayoutConstant    @"VBAutolayoutConstant"

@interface NSLayoutConstraint (VBAutolayout)

#pragma mark - short
/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (nonnull instancetype) constraintWithItem:(nonnull id)view1
                                  attribute:(NSLayoutAttribute)attr1
                                  relatedBy:(NSLayoutRelation)relation
                                     toItem:(nonnull id)view2
                                  attribute:(NSLayoutAttribute)attr2;

/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (nonnull instancetype) constraintWithItem:(nonnull id)view1
                                  attribute:(NSLayoutAttribute)attr1
                                  relatedBy:(NSLayoutRelation)relation
                                     toItem:(nonnull id)view2
                                  attribute:(NSLayoutAttribute)attr2
                                   constant:(CGFloat)c;

/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (nonnull instancetype) constraintWithItem:(nonnull id)view1
                                  attribute:(NSLayoutAttribute)attr1
                                  relatedBy:(NSLayoutRelation)relation
                                     toItem:(nonnull id)view2
                                  attribute:(NSLayoutAttribute)attr2
                                 multiplier:(CGFloat)multiplier;

#pragma mark - layout
/**
 *  Creates constraints for item based on layout dictionary.
 *  Constraint is ignored if no constant was given (as NSString or NSString value of VBAutolayoutConstant in dictionary).
 *  Superview is used if no item was given (as id value of VBAutolayoutItem in dictionary)
 *
 *  <b>Warning!</b> centerX and centerY use constant of double format only (@"100", no relation @">=100" or priority @"100@999"). This features will be added later.
 *
 *  @param view   subview
 *  @param layout Keys are VBAutolayoutAttributes, values are NSString for distance/value or NSDictionary with keys VBAutolayoutItem and VBAutolayoutConstant.
 *  @code
 @{VBAutolayoutAttribute: @{VBAutolayoutItem: item,
 VBAutolayoutConstant: @"100"},
 VBAutolayoutAttribute: @"100"}
 @endcode
 *
 *  @return Created constraints in order [top, bottom, leading, trailing, width, height, centerX, centerY]
 */
+ (nonnull NSArray<NSLayoutConstraint*>*) constraintsWithItem:(nonnull id) view1
                                                       layout:(nonnull NSDictionary*) layout;

#pragma mark - distance to items
/**
 *  Creates constraints for item to neightbours.
 *
 *  @param view         item
 *  @param topView      neighbour item or nil for superview
 *  @param topDist      @"100", @">=100", @"100@999" or nil if not needed
 *  @param bottomView   neighbour item or nil for superview
 *  @param bottomDist   @"100", @">=100", @"100@999" or nil if not needed
 *  @param leadingView  neighbour item or nil for superview
 *  @param leadingDist  @"100", @">=100", @"100@999" or nil if not needed
 *  @param trailingView neighbour item or nil for superview
 *  @param trailingDist @"100", @">=100", @"100@999" or nil if not needed
 *
 *  @return Created constraints in order [top, bottom, leading, trailing]. <br>
 *  Array.count = 0..4 according to passed params. <br>
 *  For example, [top, trailing] or [top, bottom, trailing]
 */

@end
