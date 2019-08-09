//
//  EventCollectionViewCell.m
//  CollectionViewSample
//
//  Created by Jie on 2019/8/9.
//  Copyright © 2019 jie. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellWidth = self.frame.size.width;
        CGFloat imageViewWidth = 101;
        CGFloat imageViewHeight = 101;
        CGFloat imageViewTopView = 15;
        
        _imageView = [[UIImageView alloc] initWithFrame: CGRectMake((cellWidth - imageViewWidth) / 2, imageViewTopView, imageViewWidth, imageViewHeight)];
        [self addSubview: _imageView];
        
        CGFloat labelWidth = 101;
        CGFloat labelHeight = 16;
        CGFloat labelTopView = 120;
        
        _label = [[UILabel alloc] initWithFrame: CGRectMake( (cellWidth - labelWidth) / 2, labelTopView, labelWidth, labelHeight)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:13];
        [self addSubview: _label];
        
    }
    return self;
}

@end
