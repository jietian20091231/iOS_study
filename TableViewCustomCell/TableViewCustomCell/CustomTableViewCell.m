//
//  CustomTableViewCell.m
//  TableViewCustomCell
//
//  Created by Jie on 2019/8/10.
//  Copyright © 2019 jie. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithMyStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight: (CGFloat) rowHeight  {
    NSLog(@"CustomTableViewCell:initWithStyle reuseIdentifier = %@", reuseIdentifier);
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"self.frame.size.height = %.2f", rowHeight);
        CGFloat cellHight = rowHeight;
        CGFloat imageWidth = 39;
        CGFloat imageHeight = 28;
        CGFloat imageLeftPadding = 20;
        
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeftPadding, (cellHight - imageHeight) / 2, imageWidth, imageHeight)];
        [self addSubview: _myImageView];
        
        CGFloat labelWidth = 120;
        CGFloat labelHeight = 16;
        CGFloat labelLeftView = imageWidth + 60 ;
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (rowHeight / 2 - labelHeight) / 2, labelWidth, labelHeight)];
        [self addSubview: _myLabel];

        _mySubLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelLeftView, (rowHeight / 2 - labelHeight) / 2 + rowHeight / 2, labelWidth, labelHeight)];
        [self addSubview: _mySubLabel];
        
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
