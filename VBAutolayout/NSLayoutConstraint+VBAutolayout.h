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

@interface NSLayoutConstraint (VBAutolayout)

#pragma mark - short
/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2;

/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2
                           constant:(CGFloat)c;

/**
 *  Short variant.
 *  @see constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: <br>
 *  <b>Default:</b> multiplier:1 constant:0
 */
+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2
                         multiplier:(CGFloat)multiplier;

#pragma mark - distance to items
/**
 *  Creates constraints for item to neightbours.
 *
 *  @param view         item
 *  @param topView      neighbour item or nil for superview
 *  @param topDist      @"100", @">=100", @"<100", @"100@999" or nil if not needed
 *  @param bottomView   neighbour item or nil for superview
 *  @param bottomDist   @"100", @">=100", @"<100", @"100@999" or nil if not needed
 *  @param leadingView  neighbour item or nil for superview
 *  @param leadingDist  @"100", @">=100", @"<100", @"100@999" or nil if not needed
 *  @param trailingView neighbour item or nil for superview
 *  @param trailingDist @"100", @">=100", @"<100", @"100@999" or nil if not needed
 *
 *  @return Created constraints in order [top, bottom, leading, trailing]. <br>
 *  Array.count = 0..4 according to passed params. <br>
 *  For example, [top, trailing] or [top, bottom, trailing]
 */
+ (NSArray*) constraintsWithItem:(id)view
                         topItem:(id) topView
                         topDist:(NSString*) topDist
                      bottomItem:(id) bottomView
                      bottomDist:(NSString*) bottomDist
                     leadingItem:(id) leadingView
                     leadingDist:(NSString*) leadingDist
                    trailingItem:(id) trailingView
                    trailingDist:(NSString*) trailingDist;

#pragma mark - size
/**
 *  Creates constraint for item width
 *
 *  @param view  item
 *  @param width @"100", @">=100", @"<100", @"100@999"
 *
 *  @return Created constraint
 */
+ (instancetype) constraintWithItem:(id)view
                              width:(NSString*)width;

/**
 *  Creates constraint for item height
 *
 *  @param view   item
 *  @param height @"100", @">=100", @"<100", @"100@999"
 *
 *  @return Created constraint
 */
+ (instancetype) constraintWithItem:(id)view
                             height:(NSString*)height;

@end
