//
//  RootViewController.m
//  NavigationBarSample
//
//  Created by Jie on 2019/8/7.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) UILabel * label;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat naviHeight = 44;
    
    UINavigationBar *naviBar = [[UINavigationBar alloc] initWithFrame: CGRectMake(0, 20, screen.size.width, naviHeight)];
    
    UIBarButtonItem *addbtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target: self action:@selector(addAction:)];

    UIBarButtonItem *savebtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target: self action:@selector(saveAction:)];
    
    UINavigationItem *naviItem = [[UINavigationItem alloc] initWithTitle: @"Contacts"];
    naviItem.leftBarButtonItem = addbtnItem;
    naviItem.rightBarButtonItem = savebtnItem;
    
    naviBar.items = @[naviItem];
    [self.view addSubview: naviBar];
    
    CGFloat labelW = 180;
    CGFloat labelH = 90;
    CGFloat labelX = (screen.size.width - labelW) / 2;
    CGFloat labelY = 150;
    
    _label = [[UILabel alloc] initWithFrame: CGRectMake(labelX, labelY, labelW, labelH)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Label" ;
    _label.textColor = [UIColor blueColor];
    _label.font = [UIFont boldSystemFontOfSize:20];
    _label.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(36)];
    
    [self.view addSubview:_label];
    
}

- (void) addAction: (id)sender {
    _label.text = @"Create";
}


- (void) saveAction: (id)sender {
    _label.text = @"Save";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
