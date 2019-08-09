//
//  RootViewController.m
//  PickerViewSample
//
//  Created by Jie on 2019/8/8.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView * pickerView;
@property (nonatomic, strong) UILabel * label;

@property (nonatomic, strong) NSDictionary * pickerData;
@property (nonatomic, strong) NSArray * pickerProvincesData;
@property (nonatomic, strong) NSArray * pickerCitiesData;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [UIScreen mainScreen].bounds;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces_cities" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    _pickerData = dict;
    _pickerProvincesData = [_pickerData allKeys];
    NSString *selectProvince = [_pickerProvincesData objectAtIndex:0];
    _pickerCitiesData = [_pickerData objectForKey:selectProvince];
    
    CGFloat pWidth = 320;
    CGFloat pHeight = 167;
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake((screen.size.width - pWidth) / 2, 100, pWidth, pHeight)];

    _pickerView.dataSource = self;
    _pickerView.delegate = self;

    
    [self.view addSubview: _pickerView];
    
}

#pragma mark

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    NSLog(@"RootViewContorller:numberOfComponentsInPickerView");
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if ( component == 0 ) {
        return [_pickerProvincesData count];
    } else {
        return [_pickerCitiesData count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if ( component == 0 ) {
        return [_pickerProvincesData objectAtIndex: row];
    } else {
        return [_pickerCitiesData objectAtIndex: row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"RootViewContorller:pickerView:didSelectRow:inComponent");
    NSLog(@"pickerView:didSelectRow:inComponent component  = %li", component);
    if ( component == 0 ) {
        NSString *selectProvince = [_pickerProvincesData objectAtIndex: row];
        NSLog(@"selectProvince = %@", selectProvince);
        NSArray *array = [_pickerData objectForKey: selectProvince];
        _pickerCitiesData = array;
        [pickerView reloadComponent: 1];
    }
}

@end
