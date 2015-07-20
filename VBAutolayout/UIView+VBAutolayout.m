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

#import "UIView+VBAutolayout.h"

#import "NSLayoutConstraint+VBAutolayout.h"

@implementation UIView (VBAutolayout)

#pragma mark - addSubview
- (NSArray*) addSubview:(UIView *)view
            withTopItem:(id) topView
                topDist:(NSString*) topDist
             bottomItem:(id) bottomView
             bottomDist:(NSString*) bottomDist
            leadingItem:(id) leadingView
            leadingDist:(NSString*) leadingDist
           trailingItem:(id) trailingView
           trailingDist:(NSString*) trailingDist {

    [self addSubviewAutolayoutReady:view];
    return [self addConstraintsAndLayoutSubviews:
            [NSLayoutConstraint constraintsWithItem:view
                                            topItem:topView
                                            topDist:topDist
                                         bottomItem:bottomView
                                         bottomDist:bottomDist
                                        leadingItem:leadingView
                                        leadingDist:leadingDist
                                       trailingItem:trailingView
                                       trailingDist:trailingDist]];
}

- (void) addSubviewAutolayoutReady:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
}

#pragma mark convenience
- (NSArray*) addSubview:(UIView *)view
            withTopDist:(NSString*) topDist
             bottomDist:(NSString*) bottomDist
            leadingDist:(NSString*) leadingDist
           trailingDist:(NSString*) trailingDist {
    
    return [self addSubview:view
                withTopItem:nil
                    topDist:topDist
                 bottomItem:nil
                 bottomDist:bottomDist
                leadingItem:nil
                leadingDist:leadingDist
               trailingItem:nil
               trailingDist:trailingDist];
}

#pragma mark - constraints
- (NSLayoutConstraint*) addConstraintAndLayoutSubviews:(NSLayoutConstraint*) constraint {
    return [[self addConstraintsAndLayoutSubviews:@[constraint]]
            lastObject];
}
- (NSArray*) addConstraintsAndLayoutSubviews:(NSArray *)constraints {
    [self addConstraints:constraints];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return constraints;
}

@end
