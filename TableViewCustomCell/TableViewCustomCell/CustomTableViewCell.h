//
//  CustomTableViewCell.h
//  TableViewCustomCell
//
//  Created by Jie on 2019/8/10.
//  Copyright © 2019 jie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel  *myLabel;
@property (nonatomic, strong) UILabel  *mySubLabel;
@property (nonatomic, strong) UIImageView *myImageView;


- (instancetype)initWithMyStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier rowHeight: (CGFloat) rowHeight;

@end

NS_ASSUME_NONNULL_END
