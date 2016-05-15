//
//  HfzCityTextField.m
//  HfzCityPicker
//
//  Created by Simon on 16/5/15.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HfzCityTextField.h"

@interface HfzCityTextField ()
{
    NSString *preText;
}
@end

@implementation HfzCityTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    preText = @"";
    self.delegate = self;
    [self createPickView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        [self createPickView];
    }
    return self;
}

- (void)createPickView {
    self.cityPickeView = [[HfzCityPickerView alloc] initWithDelegate:self];
    __weak typeof(self)weakSelf = self;
    self.cityPickeView.changText = ^(NSString *text) {
        weakSelf.text = text;
    };
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.cityPickeView show];
    return NO;
}

@end
