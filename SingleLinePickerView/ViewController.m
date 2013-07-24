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
    }
    
    return _singleLinePickerView;
}

@end
