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

#import "NSLayoutConstraint+VBAutolayout.h"

@implementation NSLayoutConstraint (VBAutolayout)

#pragma mark - short
+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2 {
    return [NSLayoutConstraint constraintWithItem:view1
                                        attribute:attr1
                                        relatedBy:relation
                                           toItem:view2
                                        attribute:attr2
                                       multiplier:[self defaultMultiplier]
                                         constant:[self defaultConstant]];
}

+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2
                           constant:(CGFloat)c {
    return [NSLayoutConstraint constraintWithItem:view1
                                        attribute:attr1
                                        relatedBy:relation
                                           toItem:view2
                                        attribute:attr2
                                       multiplier:[self defaultMultiplier]
                                         constant:c];
}

+ (instancetype) constraintWithItem:(id)view1
                          attribute:(NSLayoutAttribute)attr1
                          relatedBy:(NSLayoutRelation)relation
                             toItem:(id)view2
                          attribute:(NSLayoutAttribute)attr2
                         multiplier:(CGFloat)multiplier {
    return [NSLayoutConstraint constraintWithItem:view1
                                        attribute:attr1
                                        relatedBy:relation
                                           toItem:view2
                                        attribute:attr2
                                       multiplier:multiplier
                                         constant:[self defaultConstant]];
}

+ (double) defaultMultiplier {
    return 1.0f;
}

+ (double) defaultConstant {
    return 0.0f;
}

#pragma mark - distance to items
+ (NSArray*) constraintsWithItem:(id)view
                         topItem:(id) topView
                         topDist:(NSString*) topDist
                      bottomItem:(id) bottomView
                      bottomDist:(NSString*) bottomDist
                     leadingItem:(id) leadingView
                     leadingDist:(NSString*) leadingDist
                    trailingItem:(id) trailingView
                    trailingDist:(NSString*) trailingDist {
    
//#warning TODO add params check
    UIView* superview = ((UIView*)view).superview;

    NSMutableDictionary* views = [NSMutableDictionary new];
    views[@"view"] = view;
    views[@"topView"] = topView ?: superview;
    views[@"bottomView"] = bottomView ?: superview;
    views[@"leadingView"] = leadingView ?: superview;
    views[@"trailingView"] = trailingView ?: superview;

    NSMutableArray* formats = [NSMutableArray new];
    if (topDist.length) {
        [formats addObject:[NSString stringWithFormat:@"V:%@-(%@)-[view]",
                            views[@"topView"] == superview ? @"|" : @"[topView]",
                            topDist]];
    }
    if (bottomDist.length) {
        [formats addObject:[NSString stringWithFormat:@"V:[view]-(%@)-%@",
                            bottomDist,
                            views[@"bottomView"] == superview ? @"|" : @"[bottomView]"]];
    }
    if (leadingDist.length) {
        [formats addObject:[NSString stringWithFormat:@"H:%@-(%@)-[view]",
                            views[@"leadingView"] == superview  ? @"|" : @"[leadingView]",
                            leadingDist]];
    }
    if (trailingDist.length) {
        [formats addObject:[NSString stringWithFormat:@"H:[view]-(%@)-%@",
                            trailingDist,
                            views[@"trailingView"] == superview  ? @"|" : @"[trailingView]"]];
    }
    
    NSMutableArray* constraints = [NSMutableArray new];
    for (NSInteger i = 0; i < formats.count; i++) {
        NSString* format = formats[i];
        [constraints addObjectsFromArray:[self constraintsWithVisualFormat:format
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views]];
    }
    return constraints;
}

#pragma mark - size
+ (instancetype) constraintWithItem:(id)view
                              width:(NSString*)width {
//#warning TODO add params check
    return [[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[view(%@)]", width]
                                                    options:0
                                                    metrics:nil
                                                      views:@{@"view": view}]
            lastObject];
}

+ (instancetype) constraintWithItem:(id)view
                             height:(NSString*)height {
    return [[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[view(%@)]", height]
                                                    options:0
                                                    metrics:nil
                                                      views:@{@"view": view}]
            lastObject];
}

@end
