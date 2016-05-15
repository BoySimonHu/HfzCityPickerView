//
//  HfzCityTextField.h
//  HfzCityPicker
//
//  Created by Simon on 16/5/15.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HfzCityPickerView.h"

@interface HfzCityTextField : UITextField <UITextFieldDelegate, HfzCityPickerViewDelegate>

@property (nonatomic, strong) HfzCityPickerView *cityPickeView;

@end
