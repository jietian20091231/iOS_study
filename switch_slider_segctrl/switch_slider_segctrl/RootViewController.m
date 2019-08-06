//
//  RootViewController.m
//  switch_slider_segctrl
//
//  Created by JieTian on 2019/8/5.
//  Copyright © 2019 JieTian. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) UISwitch* rightSwitch;
@property (strong, nonatomic) UISwitch* leftSwitch;
@property (nonatomic, strong) UISegmentedControl * segmCtrl;
@property (nonatomic, strong) UISlider * slider;
@property (nonatomic, strong) UILabel * sliderValue;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat switchScreenSpace = 39;
    
    _rightSwitch = [UISwitch new];
    CGRect frame = _rightSwitch.frame;
    frame.origin = CGPointMake(switchScreenSpace, 120);
    _rightSwitch.tag = 0;
    _rightSwitch.frame = frame;
    _rightSwitch.on = YES;
    [_rightSwitch addTarget: self action: @selector(swtichValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _rightSwitch];
    
    _leftSwitch = [UISwitch new];
    _leftSwitch.tag = 1;
    frame = _leftSwitch.frame;
    frame.origin = CGPointMake(screen.size.width - (frame.size.width + switchScreenSpace), 120);
    _leftSwitch.frame = frame;
    _leftSwitch.on = NO;
    [_leftSwitch addTarget: self action: @selector(swtichValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _leftSwitch];
    
    NSArray* segments = @[@"One", @"Two", @"Three"];
    _segmCtrl = [[UISegmentedControl alloc] initWithItems: segments];
    _segmCtrl.selectedSegmentIndex = 1;
    
    CGFloat scWidth = 240;
    CGFloat scHeight = 29;
    CGFloat scTopView = 59;
    frame = CGRectMake( (screen.size.width - scWidth) / 2, scTopView, scWidth, scHeight);
    _segmCtrl.frame = frame;
    [_segmCtrl addTarget:self action: @selector(touchDonwn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _segmCtrl];
    
    _sliderValue = [[UILabel alloc] initWithFrame: CGRectMake(_rightSwitch.frame.origin.x, _rightSwitch.frame.origin.y + 100, 180, 29)];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(_sliderValue.frame.origin.x, _sliderValue.frame.origin.y + 50 , 300,  29)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 99;
    [_slider setValue:0 animated: YES];
    [_slider addTarget: self action: @selector(silderBarChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _slider];
    
    NSString* valueStr = [[NSString alloc] initWithFormat: @"Slider value is %2i", (int)[_slider value] ];
    _sliderValue.text = valueStr;
    [self.view addSubview: _sliderValue];
    
    
    
}

- (void) swtichValueChanged: (id)sender {
    NSLog(@"RootViewController:swtichValueChanged");
    UISwitch* tmpSwitch = (UISwitch*) sender;
    NSLog(@"_leftSwitch.tag = %ld, tmpSwitch.tag = %ld", _leftSwitch.tag, tmpSwitch.tag);
    if ( _leftSwitch.tag == tmpSwitch.tag ) {
        NSLog(@"_leftSwitch is changed");
        _rightSwitch.on = !(_leftSwitch.on);
    } else if ( _rightSwitch.tag == tmpSwitch.tag ) {
        _leftSwitch.on = !(_rightSwitch.on);
    }
}

- (void) touchDonwn : (id) sender {
    NSLog(@"RootViewController:touchDonwntouchDonwn %i", (int)[(UISegmentedControl *)sender selectedSegmentIndex]);
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
            _leftSwitch.hidden = YES;
            _rightSwitch.hidden = NO;
            break;
        case 1:
            _leftSwitch.hidden = NO;
            _rightSwitch.hidden = NO;
            break;
        case 2:
            _leftSwitch.hidden = NO;
            _rightSwitch.hidden = YES;
            break;
        default:
            NSLog(@"Do nothing");
            break;
    }
}

- (void) silderBarChanged : (id) sender {
    NSLog(@"RootViewController:silderBarChanged value = %i", (int) [(UISlider *) sender value]);
    NSString* valueStr = [[NSString alloc] initWithFormat: @"Slider value is %2i", (int) [(UISlider *) sender value] ];
    _sliderValue.text = valueStr;
}



@end

