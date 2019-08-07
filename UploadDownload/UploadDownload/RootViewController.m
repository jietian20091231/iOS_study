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
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) NSTimer * timer;
@property int downloadFlag;

@end

@implementation RootViewController


- (void)viewDidAppear:(BOOL)animated {
    _downloadFlag = 1;
}

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
    [btnUpload addTarget: self action: @selector(uploadClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnUpload];
    
    CGFloat prgWidth = 300;
    CGFloat prgHeight = 2;
    CGFloat prgy = 283;
    CGFloat prgx = (screen.size.width - prgWidth) / 2;
    
    _progressView = [[UIProgressView alloc] initWithFrame: CGRectMake(prgx, prgy, prgWidth, prgHeight)];
    [_progressView setProgress: 0.25];
    [self.view addSubview: _progressView];
    
    TORoundedButton *btnDownload = [[TORoundedButton alloc] initWithText: @"Download"];
    [btnDownload setFrame: CGRectMake((screen.size.width - btnDownload.frame.size.width) / 2, prgy + 40, btnDownload.frame.size.width, btnDownload.frame.size.height)];
    [btnDownload addTarget: self action: @selector(downloadClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnDownload];

}

- (void) uploadClick: (id) sender {
    NSLog( @"RootViewController:uploadClick" );
    if ([_activeIndicator isAnimating]) {
        [_activeIndicator stopAnimating];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    } else {
        [_activeIndicator startAnimating];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

- (void) download {
    _progressView.progress += 0.1;
    if ( _progressView.progress == 1.0 ) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Download Completed" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:okAction];
        [self presentViewController: alert animated: YES completion:^{
            self.downloadFlag = 1;
            self.progressView.progress = 0;
        }];
        [_timer invalidate];
        _timer = nil;
        
    }
    
}

- (void) downloadClick: (id) sender {
    NSLog( @"RootViewController:downloadClick" );
    if ( 0 == _downloadFlag ) {
        [_timer invalidate];
        _timer = nil;
        _downloadFlag = 1;
    } else {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target: self selector: @selector(download) userInfo:nil repeats:YES];
        _downloadFlag = 0;
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
