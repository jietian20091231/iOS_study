//
//  RootViewController.m
//  UploadDownload
//
//  Created by Jie on 2019/8/6.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"
#import "TORoundedButton.h"

@interface RootViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *activeIndicator;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    _activeIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake( (screen.size.width - 40) / 2 , 86, 40, 40)];
    _activeIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activeIndicator.transform = CGAffineTransformMakeScale(2, 2);
    
    _activeIndicator.hidesWhenStopped = YES;
    [self.view addSubview: _activeIndicator];
    
    TORoundedButton *btnUpload = [[TORoundedButton alloc] initWithText: @"Upload"];
    [btnUpload setFrame: CGRectMake((screen.size.width - btnUpload.frame.size.width) / 2, 86 + 40 + btnUpload.frame.size.height, btnUpload.frame.size.width, btnUpload.frame.size.height)];
    [btnUpload addTarget: self action: @selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnUpload];
    
}

- (void) btnClick: (id) sender {
    NSLog( @"RootViewController:btnClick" );
    if ([_activeIndicator isAnimating]) {
        [_activeIndicator stopAnimating];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    } else {
        [_activeIndicator startAnimating];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
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
