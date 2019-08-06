//
//  RootViewController.m
//  AlertActionSheet
//
//  Created by Jie on 2019/8/6.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIButton* btnAlertView = [UIButton buttonWithType: UIButtonTypeSystem];
    [btnAlertView setTitle: @"Alert View" forState: UIControlStateNormal];
    [btnAlertView addTarget: self action: @selector(showAlerView:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat btnWidth = 100;
    CGFloat btnHeight = 60;
    CGFloat btnTopView = 130;
    
    btnAlertView.frame = CGRectMake((screen.size.width - btnWidth) / 2, btnTopView, btnWidth, btnHeight);
    [self.view addSubview: btnAlertView];
    
    
    UIButton* btnAlertSheet = [UIButton buttonWithType: UIButtonTypeSystem];
    [btnAlertSheet setTitle: @"Alert Sheet" forState: UIControlStateNormal];
    [btnAlertSheet addTarget: self action: @selector(showAlertSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    btnTopView = 260;
    
    btnAlertSheet.frame = CGRectMake((screen.size.width - btnWidth) / 2, btnTopView, btnWidth, btnHeight);
    [self.view addSubview: btnAlertSheet];
    
}

- (void) showAlerView: (id) sender {
    UIAlertController* alertController = [UIAlertController
        alertControllerWithTitle:@"Warrning"
        message: @"Attention Please"
        preferredStyle:UIAlertControllerStyleAlert
    ];
    
    UIAlertAction* noAction = [
        UIAlertAction actionWithTitle: @"No"
        style:UIAlertActionStyleCancel
        handler:^(UIAlertAction *action) {
                NSLog(@"Tap No Button");
        }
    ];
    
    UIAlertAction* yesAction = [
        UIAlertAction actionWithTitle: @"Yes"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
            NSLog(@"Tap Yes Button");
        }
    ];
    
    [alertController addAction: yesAction];
    [alertController addAction: noAction];
    
    [self presentViewController: alertController animated: YES completion: nil];
}

- (void) showAlertSheet: (id) sender {
    UIAlertController* alertSheet = [[UIAlertController alloc] init];
    
    UIAlertAction* cancelAction = [
        UIAlertAction actionWithTitle:@"Cancel"
        style:UIAlertActionStyleCancel
        handler:^(UIAlertAction *action){
            NSLog(@"Tap Cancel Button");
        }
   ];
    
    UIAlertAction *destructiveAction = [
        UIAlertAction actionWithTitle: @"Distructive"
        style:UIAlertActionStyleDestructive
        handler:^(UIAlertAction *action) {
            NSLog( @"Tap Distructive Button");
    }];
    
    UIAlertAction *otherAction = [
        UIAlertAction actionWithTitle: @"Other"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
            NSLog( @"Tap Other Button");
    }];
    
    [alertSheet addAction: otherAction];
    [alertSheet addAction: destructiveAction];
    [alertSheet addAction: cancelAction];
    
    alertSheet.popoverPresentationController.sourceView = sender;
    [self presentViewController:alertSheet animated:YES completion:nil];
}

@end
