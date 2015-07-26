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

#import "UIView+VBAutolayoutConvenience.h"

#import "UIView+VBAutolayout.h"
#import "NSLayoutConstraint+VBAutolayout.h"

@implementation UIView (VBAutolayoutConvenience)

#pragma mark - addSubview
- (NSArray*) addSubview:(UIView *)view
             withLayout:(NSDictionary*)layout {
#warning TODO validate dictionary
    
    id topItem = [self itemWithAttributeValue:layout[VBAutolayoutTop]];
    NSString* topDist = [self distanceWithAttributeValue:layout[VBAutolayoutTop]];
    id bottomItem = [self itemWithAttributeValue:layout[VBAutolayoutBottom]];
    NSString* bottomDist = [self distanceWithAttributeValue:layout[VBAutolayoutBottom]];
    id leadingItem = [self itemWithAttributeValue:layout[VBAutolayoutLeading]];
    NSString* leadingDist = [self distanceWithAttributeValue:layout[VBAutolayoutLeading]];
    id trailingItem = [self itemWithAttributeValue:layout[VBAutolayoutTrailing]];
    NSString* trailingDist = [self distanceWithAttributeValue:layout[VBAutolayoutTrailing]];

    [self addSubviewAutolayoutReady:view];
    
    NSMutableArray* constraints = [NSMutableArray new];
    [constraints addObjectsFromArray:
      [NSLayoutConstraint constraintsWithItem:view
                                      topItem:topItem
                                      topDist:topDist
                                   bottomItem:bottomItem
                                   bottomDist:bottomDist
                                  leadingItem:leadingItem
                                  leadingDist:leadingDist
                                 trailingItem:trailingItem
                                 trailingDist:trailingDist]];
    
    NSString* width = [self distanceWithAttributeValue:layout[VBAutolayoutWidth]];
    [constraints addObject:
     [NSLayoutConstraint constraintWithItem:view
                                      width:width]];
    
    NSString* height = [self distanceWithAttributeValue:layout[VBAutolayoutHeight]];
    [constraints addObject:
     [NSLayoutConstraint constraintWithItem:view
                                      width:height]];
    
    [self addConstraintsAndLayoutSubviews:constraints];
    
    return constraints;
}

- (NSString*) distanceWithAttributeValue:(id)attributeValue {
    return [attributeValue isKindOfClass:[NSDictionary class]] ? attributeValue[VBAutolayoutDistance] : attributeValue;
}

- (id) itemWithAttributeValue:(id)attributeValue {
    return [attributeValue isKindOfClass:[NSDictionary class]] ? attributeValue[VBAutolayoutItem] : nil;
}

@end
