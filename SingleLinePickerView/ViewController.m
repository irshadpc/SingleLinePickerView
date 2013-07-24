//
//  ViewController.m
//  SingleLinePickerView
//
//  Created by zhanglongyang on 7/24/13.
//  Copyright (c) 2013 Coscico. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize singleLinePickerView = _singleLinePickerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"SingleLinePickerView demo";
    
    [self.view addSubview:self.singleLinePickerView];
}

- (SingleLinePickerView *)singleLinePickerView
{
    if (!_singleLinePickerView) {
        _singleLinePickerView = [[SingleLinePickerView alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
        _singleLinePickerView.dataSource = self;
        _singleLinePickerView.delegate = self;
    }
    
    return _singleLinePickerView;
}

#pragma mark - SingleLinePickerViewDataSource
- (NSUInteger)numberOfItemsInPickerView:(SingleLinePickerView *)pickerView
{
    return 10;
}

- (NSString *)pickerView:(SingleLinePickerView *)pickerView contentAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"Content:%i", index + 1];
}

#pragma mark - SingleLinePickerViewDelegate
- (void)pickerView:(SingleLinePickerView *)pickerView selectAtIndex:(NSUInteger)index
{
    
}

@end
