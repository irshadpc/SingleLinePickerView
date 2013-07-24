//
//  SingleLinePickerView.h
//  SingleLinePickerView
//
//  Created by zhanglongyang on 7/24/13.
//  Copyright (c) 2013 Coscico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class SingleLinePickerView;

@protocol SingleLinePickerViewDataSource <NSObject>

- (NSUInteger)numberOfItemsInPickerView:(SingleLinePickerView *)pickerView;
- (NSString *)pickerView:(SingleLinePickerView *)pickerView contentAtIndex:(NSUInteger)index;

@end

@protocol SingleLinePickerDelegate <NSObject>

- (void)pickerView:(SingleLinePickerView *)pickerView selectAtIndex:(NSUInteger)index;

@end

@interface SingleLinePickerView : UIView

@end
