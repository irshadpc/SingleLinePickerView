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

@property (nonatomic, assign) NSUInteger selectedItem;

@end

@implementation SingleLinePickerView

@synthesize contentView = _contentView;
@synthesize selectedItem = _selectedItem;
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
}

- (UIScrollView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.pagingEnabled = YES;
        _contentView.delegate = self;
        
        _contentView.layer.borderColor = [UIColor redColor].CGColor;
        _contentView.layer.borderWidth = 2;
    }
    
    return _contentView;
}

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated
{
    [self.contentView setContentOffset:CGPointMake(self.contentView.frame.size.width * index, 0) animated:animated];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self pointInside:point withEvent:event]) {
        return self.contentView;
    }
    
    return nil;
}

- (void)reloadData
{
    
}

- (void)loadData
{
    for (NSUInteger index = 0; index < self.itemCount; index++) {
        
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
    
    self.contentView.contentSize = CGSizeMake(self.contentView.frame.size.width * self.itemCount, self.contentView.frame.size.height);
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

- (void)determineCurrentItem
{
    self.selectedItem = self.contentView.contentOffset.x / self.contentView.frame.size.width;
    
    if ([self.delegate respondsToSelector:@selector(pickerView:selectAtIndex:)]) {
        [self.delegate pickerView:self selectAtIndex:self.selectedItem];
    }
}

- (void)setSelectedItem:(NSUInteger)selectedItem
{
    if (selectedItem >= self.itemCount) {
        return;
    }
    
    _selectedItem = selectedItem;
    
    [self scrollToIndex:selectedItem animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [self loadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self determineCurrentItem];
}

@end
