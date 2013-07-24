//
//  SingleLinePickerView.m
//  SingleLinePickerView
//
//  Created by zhanglongyang on 7/24/13.
//  Copyright (c) 2013 Coscico. All rights reserved.
//

#import "SingleLinePickerView.h"

@interface SingleLinePickerView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentView;

@end

@implementation SingleLinePickerView

@synthesize contentView = _contentView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)initialization
{
    [self addSubview:self.contentView];
    
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 2;
}

- (UIScrollView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.pagingEnabled = YES;
        _contentView.delegate = self;
    }
    
    return _contentView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

@end
