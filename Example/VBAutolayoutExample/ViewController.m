//
//  ViewController.m
//  VBAutolayoutExample
//
//  Created by Valeriy Bezuglyy on 20/07/15.
//  Copyright (c) 2015 Valeriy Bezuglyy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* value = @">=10@999";
    value = @"10@999";
    value = @"10";

    NSArray* comps = [[value stringByReplacingOccurrencesOfString:@"(\\D*)(\\d*)@?(\\d*)"
                                                      withString:@"$1,$2,$3"
                                                         options:NSRegularExpressionSearch
                                                           range:NSMakeRange(0, value.length)]
                      componentsSeparatedByString:@","];
    NSLog(@"%@ = %@", value, comps);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
