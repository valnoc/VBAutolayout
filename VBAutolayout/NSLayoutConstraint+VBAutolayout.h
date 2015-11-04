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
 Creates constraints for item based on layout dictionary.
 Constraints are created only for VBAutolayoutAttribute-s contained in layout dictionary. Attribute is ignored if no VBAutolayoutConstant value was given.
 
 Layout dictionary format:
 @{VBAutolayoutAttribute: <1>,
   VBAutolayoutAttribute: <2>,
   VBAutolayoutAttribute: <3>
 }

 <1> =  @[@{VBAutolayoutItem: <item>,
            VBAutolayoutConstant: <const>},
          @{VBAutolayoutItem: <item>,
            VBAutolayoutConstant: <const>}]
 
 <2> =  @{VBAutolayoutItem: <item>,
          VBAutolayoutConstant: <const>}
 
 <3> =  <const>
 
 <item> is a view2 in constraint
 <const> is a string with the same format as could be used for Visual Format Constraints Creation
    <relation><constant>@<priority>, ex. 10, ==10, >=10, <=10, 10@999, >=10@999, etc.
    <relation> =    1) <, <= for <=
                    2) >, >= for >=
                    3) =, == for ==

 @return Created constraints in order [top, bottom, leading, trailing, width, height, centerX, centerY]
 */
+ (nonnull NSArray<NSLayoutConstraint*>*) constraintsWithItem:(nonnull id) view1
                                                       layout:(nonnull NSDictionary*) layout;

@end
