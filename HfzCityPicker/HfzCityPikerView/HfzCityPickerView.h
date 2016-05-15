//
//  HfzCityPickerView.h
//  HfzCityPicker
//
//  Created by Simon on 16/5/15.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HfzCityPickerView;

@protocol HfzCityPickerViewDelegate <NSObject>

@optional
-(void)pickerDidChange:(HfzCityPickerView *)picker;

@end

@interface HfzCityPickerView : UIView

@property (weak, nonatomic) IBOutlet UIPickerView *cityPickerView;
@property (nonatomic, weak) id <HfzCityPickerViewDelegate> delegate;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *district;

@property (nonatomic, copy) void (^changText) (NSString *);

- (id)initWithDelegate:(id <HfzCityPickerViewDelegate>)delegate;

- (void)show;

- (void)cancelPicker;

@end
