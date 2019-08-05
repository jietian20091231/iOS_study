//
//  RootViewController.m
//  WebViewSample
//
//  Created by Jie on 2019/8/5.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>

@interface RootViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView * webView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    NSLog(@"screen.width = %.2f, screen.height = %.2f", screen.size.width, screen.size.height);
    
    //Buttons
    CGFloat btnBarWidth = 374;
    CGFloat btnBarSpace  = 37;
    CGFloat barBtnheight = 30;
    UIView* btnBar = [[UIView alloc] initWithFrame:CGRectMake( (screen.size.width - btnBarWidth) / 2 , 40 , btnBarWidth, 40 )];

    CGFloat x = btnBar.frame.origin.x;
    CGFloat y = (btnBar.frame.size.height - barBtnheight) / 2;
    CGFloat btnWidth = (btnBarWidth - btnBarSpace * 2) / 3;
    //NSLog(@"btnWidth = %.2f, y = %.2f", btnWidth, y);
    
    
    UIButton* loadWebPageBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [loadWebPageBtn setTitle: @"Html" forState: UIControlStateNormal];
    loadWebPageBtn.frame = CGRectMake( x, y, btnWidth, barBtnheight);
    loadWebPageBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loadWebPageBtn addTarget:self action:@selector(loadHtmlPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview: loadWebPageBtn];
    
    
    UIButton* loadDataBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [loadDataBtn setTitle: @"Data" forState: UIControlStateNormal];
    loadDataBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    loadDataBtn.frame = CGRectMake(x + btnBarSpace + btnWidth, y, btnWidth, barBtnheight);
    [loadDataBtn addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview: loadDataBtn];

    UIButton* loadRequestBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [loadRequestBtn setTitle: @"Request" forState: UIControlStateNormal];
    loadRequestBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    loadRequestBtn.frame = CGRectMake(x + btnBarSpace * 2 + btnWidth * 2, y, btnWidth, barBtnheight);
    [loadRequestBtn addTarget:self action:@selector(loadRequest:) forControlEvents:UIControlEventTouchUpInside];
    [btnBar addSubview: loadRequestBtn];

    [self.view addSubview: btnBar];

    NSLog( @"btnBar.orign(%.2f, %.2f), size(%.2f, %.2f)", btnBar.frame.origin.x, btnBar.frame.origin.y, btnBar.frame.size.width, btnBar.frame.size.height );
    
    //WKWebView
    _webView = [[WKWebView alloc] initWithFrame: CGRectMake( btnBar.frame.origin.x , btnBar.frame.origin.y + 60, btnBarWidth, screen.size.height - btnBar.frame.origin.y - 80 )];
    _webView.backgroundColor = [UIColor redColor];
    [self.view addSubview: _webView];
    
   NSLog( @"webView.orign(%.2f, %.2f), size(%.2f, %.2f)", _webView.frame.origin.x, _webView.frame.origin.y, _webView.frame.size.width, _webView.frame.size.height );
    
    
    
}

-(void) loadHtmlPage : (id)sender {
    NSLog(@"RootViewController:loadHtmlPage");
}

-(void) loadData : (id)sender {
    NSLog(@"RootViewController:loadData");
}

-(void) loadRequest : (id)sender {
    NSLog(@"RootViewController:loadRequest");
    NSURL *url = [NSURL URLWithString: @"https://www.google.com/ncr"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest: request];
    _webView.navigationDelegate = self;
}

#pragma mark

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"RootViewController:didStartProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"RootViewController:didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"RootViewController:didFinishNavigation");
}


- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"RootViewController:didFailNavigation");
}


@end
