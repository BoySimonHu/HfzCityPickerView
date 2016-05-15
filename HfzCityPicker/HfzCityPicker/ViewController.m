//
//  ViewController.m
//  HfzCityPicker
//
//  Created by Simon on 16/5/15.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "ViewController.h"
#import "HfzCityPickerView.h"

@interface ViewController () <HfzCityPickerViewDelegate>

{
    HfzCityPickerView *pickView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
