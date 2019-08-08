//
//  RootViewController.m
//  DataPickerSample
//
//  Created by Jie on 2019/8/7.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"
#import "TORoundedButton.h"

@interface RootViewController ()
@property (nonatomic, strong) UIDatePicker * dataPicker;
@property (nonatomic, strong) UILabel * label;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat pWidth = 320;
    CGFloat pHeight = 167;
    
    _dataPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, pWidth, pHeight)];
    //_dataPicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    _dataPicker.datePickerMode = UIDatePickerModeDateAndTime;
    [_dataPicker addTarget:self action:@selector(pickerChagned:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview: _dataPicker];
    
    CGFloat labelH = 40;
    CGFloat labelX = 50;
    CGFloat labelY = 40;
    
    _label = [[UILabel alloc] initWithFrame: CGRectMake(labelX, _dataPicker.frame.origin.y + pHeight + labelY, screen.size.width - labelY * 2 , labelH)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Label" ;
    _label.textColor = [UIColor blueColor];
    _label.font = [UIFont boldSystemFontOfSize:20];
    _label.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(30)];
    
    [self.view addSubview: _label];
    
    TORoundedButton *btnGetData = [[TORoundedButton alloc] initWithText: @"Reset"];
    [btnGetData setFrame: CGRectMake((screen.size.width - btnGetData.frame.size.width) / 2, _label.frame.origin.y + 40 + btnGetData.frame.size.height, btnGetData.frame.size.width, btnGetData.frame.size.height)];
    [btnGetData addTarget: self action: @selector(getDataClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnGetData];
    
    
}

- (void) pickerChagned: (id) sender {
    NSLog(@"RootViewController:pickerChagned");
    NSDate* theDate = _dataPicker.date;
    NSLog(@"the data picked: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat= @"MM/dd/YYYY HH:mm:ss";
    NSLog(@"the data formate is : %@", [dateFormatter stringFromDate: theDate] );
    _label.text = [dateFormatter stringFromDate: theDate];
}

- (void) getDataClick : (id) sender {
    NSLog(@"RootViewController:getDataClick");
    NSDate* theDate = [NSDate date];
    NSLog(@"the data picked: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    [_dataPicker setDate:theDate animated:YES];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat= @"MM/dd/YYYY HH:mm:ss";
    NSLog(@"the data formate is : %@", [dateFormatter stringFromDate: theDate] );
    _label.text = [dateFormatter stringFromDate: theDate];
    
    
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
