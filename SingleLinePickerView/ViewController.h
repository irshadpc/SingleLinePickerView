//
//  ViewController.h
//  SingleLinePickerView
//
//  Created by zhanglongyang on 7/24/13.
//  Copyright (c) 2013 Coscico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleLinePickerView.h"

@interface ViewController : UIViewController<SingleLinePickerViewDataSource, SingleLinePickerViewDelegate>

@property (nonatomic, strong) SingleLinePickerView *singleLinePickerView;

@end
