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

#define VBAutolayoutAttributeTop         @"VBAutolayoutAttributeTop"
#define VBAutolayoutAttributeBottom      @"VBAutolayoutAttributeBottom"
#define VBAutolayoutAttributeLeading     @"VBAutolayoutAttributeLeading"
#define VBAutolayoutAttributeTrailing    @"VBAutolayoutAttributeTrailing"

#define VBAutolayoutAttributeWidth       @"VBAutolayoutAttributeWidth"
#define VBAutolayoutAttributeHeight      @"VBAutolayoutAttributeHeight"

#define VBAutolayoutItem        @"VBAutolayoutItem"
#define VBAutolayoutDistance    @"VBAutolayoutDistance"

@interface UIView (VBAutolayoutConvenience)

#pragma mark - addSubview
/**
 *  Add subview with constraints
 *
 *  @param view   subview
 *  @param layout Keys are VBAutolayoutAttributes, values are NSString for distance/value or NSDictionary with keys VBAutolayoutItem and VBAutolayoutDistance. 
 *  @code 
@{VBAutolayoutAttribute: @{VBAutolayoutItem: item,
                           VBAutolayoutDistance: @"100"}, 
  VBAutolayoutAttribute: @"100"} 
@endcode
 *
 *  @return Created constraints in order [top, bottom, leading, trailing, width, height]
 */
- (NSArray*) addSubview:(UIView *)view
             withLayout:(NSDictionary*)layout;

@end
