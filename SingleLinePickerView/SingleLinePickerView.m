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
@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)didMoveToSuperview
{
    [self loadData];
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

- (void)reloadData
{
    
}

- (void)loadData
{
    for (NSUInteger index = 0; index < [self itemCount]; index++) {
        
        CGRect contentFrame = self.contentView.bounds;
        contentFrame.origin.x = self.contentView.bounds.size.width * index;
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:contentFrame];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.font = [UIFont systemFontOfSize:24];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.text = [self contentAtIndex:index];
        
        [self.contentView addSubview:contentLabel];
    }
}

- (NSUInteger)itemCount
{
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInPickerView:)]) {
        return [self.dataSource numberOfItemsInPickerView:self];
    }
    
    return 0;
}

- (NSString *)contentAtIndex:(NSUInteger)index
{
    if ([self.dataSource respondsToSelector:@selector(pickerView:contentAtIndex:)]) {
        return [self.dataSource pickerView:self contentAtIndex:index];
    }
    
    return nil;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

@end
