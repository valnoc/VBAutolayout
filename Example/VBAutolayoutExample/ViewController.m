//
//  ViewController.m
//  VBAutolayoutExample
//
//  Created by Valeriy Bezuglyy on 20/07/15.
//  Copyright (c) 2015 Valeriy Bezuglyy. All rights reserved.
//

#import "ViewController.h"

#import "VBAutolayout.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel* lb1;
@property (nonatomic, strong) UILabel* lb2;
@property (nonatomic, strong) UILabel* lb3;
@property (nonatomic, strong) UILabel* lb4;
@property (nonatomic, strong) UILabel* lb5;
@property (nonatomic, strong) UILabel* lb6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lb1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.lb1.text = @"Test 1";
    self.lb1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.lb1
               withLayout:@{VBAutolayoutAttributeTop:       @"20",
                            VBAutolayoutAttributeLeading:   @"0",
                            VBAutolayoutAttributeTrailing:  @"0"}];
    
    self.lb2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.lb2.text = @"Test 2";
    self.lb2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.lb2
               withLayout:@{VBAutolayoutAttributeTop:       @{VBAutolayoutItem: self.lb1},
                            VBAutolayoutAttributeLeading:   @"8",
                            VBAutolayoutAttributeTrailing:  @"8"}];
    
    self.lb3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.lb3.text = @"Test 3";
    self.lb3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.lb3
               withLayout:@{VBAutolayoutAttributeTop:       @{VBAutolayoutItem:     self.lb2,
                                                              VBAutolayoutConstant: @"20"},
                            VBAutolayoutAttributeWidth:     @"140",
                            VBAutolayoutAttributeHeight:    @"40",
                            VBAutolayoutAttributeCenterX:   @"0"}];
    
    self.lb4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.lb4.text = @"Test 4";
    self.lb4.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.lb4
               withLayout:@{VBAutolayoutAttributeLeading:   @"8",
                            VBAutolayoutAttributeCenterY:   @"0"}];
    
    self.lb5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.lb5.text = @"Test 5";
    self.lb5.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.lb5
               withLayout:@{VBAutolayoutAttributeLeading:   @{VBAutolayoutItem: self.lb4,
                                                              VBAutolayoutConstant: @"8"},
                            VBAutolayoutAttributeTrailing:  @"16",
                            VBAutolayoutAttributeHeight:    @"40",
                            VBAutolayoutAttributeCenterY:   @{VBAutolayoutItem: self.lb4,
                                                              VBAutolayoutConstant: @"-15"}}];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
