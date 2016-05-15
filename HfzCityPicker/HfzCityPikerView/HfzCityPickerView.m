//
//  HfzCityPickerView.m
//  HfzCityPicker
//
//  Created by Simon on 16/5/15.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HfzCityPickerView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface HfzCityPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

{
    NSArray *provinces, *cities, *areas;
    NSString *preCity;
}

@end

@implementation HfzCityPickerView

- (id)initWithDelegate:(id<HfzCityPickerViewDelegate>)delegate {
    self = [[[NSBundle mainBundle] loadNibNamed:@"HfzCityPickerView" owner:self options:nil] lastObject];
    if (self) {
        self.cityPickerView.delegate = self;
        self.cityPickerView.dataSource = self;
        
        //load data
        provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"]];
        self.province = [[provinces objectAtIndex:0] objectForKey:@"state"];
        
        cities = [[provinces objectAtIndex:0] objectForKey:@"cities"];
        self.city = [[cities objectAtIndex:0] objectForKey:@"city"];
        
        areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
        if (!areas || areas.count == 0) {
            self.district = @"";
        } else {
            self.district = [areas objectAtIndex:0];
        }
    }
    
    return self;
}

#pragma mark --picker view delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            return provinces.count;
        }
            break;
        case 1:
        {
            return cities.count;
        }
            break;
        case 2:
        {
            return areas.count;
        }
            break;
            
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            return [[provinces objectAtIndex:row] objectForKey:@"state"];
        }
            break;
        case 1:
        {
            return [[cities objectAtIndex:row] objectForKey:@"city"];
        }
            break;
        case 2:
        {
            if (areas && areas.count != 0) {
                return [areas objectAtIndex:row];
                break;
            }
        }
        default:
            return @"";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            cities = [[provinces objectAtIndex:row] objectForKey:@"cities"];
            self.province = [[provinces objectAtIndex:row] objectForKey:@"state"];
            [self.cityPickerView selectRow:0 inComponent:1 animated:YES];
            [self.cityPickerView reloadComponent:1];
            
            areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
            self.city = [[cities objectAtIndex:0] objectForKey:@"city"];
            [self.cityPickerView selectRow:0 inComponent:2 animated:YES];
            [self.cityPickerView reloadComponent:2];
            
            if (!areas || areas.count == 0) {
                self.district = @"";
            } else {
                self.district = [areas objectAtIndex:0];
            }

        }
            break;
        case 1:
        {
            areas = [[cities objectAtIndex:row] objectForKey:@"areas"];
            self.city = [[cities objectAtIndex:row] objectForKey:@"city"];
            [self.cityPickerView selectRow:0 inComponent:2 animated:YES];
            [self.cityPickerView reloadComponent:2];
            
            if (!areas || areas.count == 0) {
                self.district = @"";
            } else {
                self.district = [areas objectAtIndex:0];
            }
        }
            break;
        case 2:
        {
            if (!areas || areas.count == 0) {
                self.district = @"";
            } else {
                self.district = [areas objectAtIndex:row];
            }
        }
            break;
        default:
            break;
    }
    self.changText([NSString stringWithFormat:@"%@%@%@", self.province, self.city, self.district]);
}

- (void)show {
    UIView *view = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, view.frame.size.height, WIDTH, self.frame.size.height);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, WIDTH, self.frame.size.height);
    }];
    
}
- (IBAction)cancelAction:(id)sender {
    if (preCity.length != 0) {
        self.changText(preCity);
    } else {
        self.changText(@"");    
    }
    [self cancelPicker];
}
- (IBAction)okAction:(id)sender {
    preCity = [NSString stringWithFormat:@"%@%@%@", self.province, self.city, self.district];
    self.changText(preCity);
    
    [self cancelPicker];
}

- (void)cancelPicker {
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, self.frame.origin.y+self.frame.size.height, WIDTH, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         
                     }];
    
}

@end
