//
//  RootViewController.m
//  ToolBarSample
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
    
    CGFloat toolBarHeight = 60;
    UIToolbar* toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height - toolBarHeight, screen.size.width, toolBarHeight)];
    
    UIBarButtonItem *saveBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(save:)];
    
    
    UIBarButtonItem *openBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    UIBarButtonItem *flexibleButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolBar.items = @[openBtnItem, flexibleButtonItem, saveBtnItem ];
    [self.view addSubview: toolBar];
    
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

-(void) save: (id) sender {
    _label.text = @"Save";
}

-(void) open: (id) sender {
    _label.text = @"Open";
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
