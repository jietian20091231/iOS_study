//
//  CustomTableViewCell.m
//  TableViewCustomCell
//
//  Created by Jie on 2019/8/10.
//  Copyright © 2019 jie. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"CustomTableViewCell:initWithStyle reuseIdentifier = %@", reuseIdentifier);
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat cellHight = self.frame.size.height;
        CGFloat imageWidth = 39;
        CGFloat imageHeight = 28;
        CGFloat imageLeftPadding = 300;
        
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeftPadding, (cellHight - imageHeight) / 2, imageWidth, imageHeight)];
        [self addSubview: _myImageView];
        
        CGFloat labelWidth = 120;
        CGFloat labelHeight = 21;
        CGFloat labelLeftView = 15;
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (cellHight - labelHeight) / 2, labelWidth, labelHeight)];
        [self addSubview: _myLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
