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

@interface UIView (VBAutolayoutConvenience)

#pragma mark - addSubview
/**
 *  Add subview with constraints. 
 *  Constraint is ignored if no constant was given (as NSString or NSString value of VBAutolayoutConstant in dictionary).
 *  Superview is used if no item was given (as id value of VBAutolayoutItem in dictionary)
 *
 *  <b>Warning!</b> centerX and centerY use constant of double format only (@"100", no relation @">100" or priority @"100@999"). This features will be added later.
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
- (NSArray*) addSubview:(UIView *)view
             withLayout:(NSDictionary*)layout;

@end
