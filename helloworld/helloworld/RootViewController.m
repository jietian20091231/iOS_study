//
//  RootViewController.m
//  helloworld
//
//  Created by Jie on 2019/8/2.
//  Copyright © 2019 jie. All rights reserved.
//


#import "RootViewController.h"

static NSString* old_label = @"0123456789";

@interface RootViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UITextField* firstNameField;
@property (nonatomic, strong) UITextField* lastNameField;
@property (nonatomic, strong) UITextField* numberField;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView* viewA = [[UIView alloc] init];
//    viewA.backgroundColor = [UIColor grayColor];
//    viewA.frame = CGRectMake(0, 0, 300, 400);
//    [self.view addSubview: viewA];
//
//    UIView* viewB = [[UIView alloc] init];
//    viewB.backgroundColor = [UIColor greenColor];
//    viewB.frame = CGRectMake(50, 100, 100, 200);
//    [viewA addSubview: viewB];
//
//    NSLog( @"frame_x: %.2f, frame_y: %.2f", viewB.frame.origin.x, viewB.frame.origin.y);
//    NSLog( @"frame_w: %.2f, frame_h: %.2f", viewB.frame.size.width, viewB.frame.size.height);
//
//    NSLog( @"bounds_x: %.2f, bounds_y: %.2f", viewB.bounds.origin.x, viewB.bounds.origin.y );
//    NSLog( @"bounds_w: %.2f, bounds_h: %.2f", viewB.bounds.size.width, viewB.bounds.size.height );
    
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 180;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 100;
    NSLog( @"screen.size.width = %.2f", screen.size.width);
    CGRect frame = CGRectMake((screen.size.width - labelWidth)/2, labelTopView , labelWidth, labelHeight);

    _label = [[UILabel alloc] initWithFrame: frame];
    _label.text = old_label;
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];

    UIButton* button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle: @"Click Me" forState: UIControlStateNormal];

    CGFloat buttonWidth = 120;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 150;

    button.frame = CGRectMake((screen.size.width / 2 - buttonWidth) / 2, buttonTopView, buttonWidth, buttonHeight);

    [button addTarget:self action: @selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];


    UIButton* resetBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [resetBtn setTitle: @"Reset" forState: UIControlStateNormal];

    resetBtn.frame = CGRectMake( screen.size.width / 2 + (screen.size.width / 2 - buttonWidth) / 2, buttonTopView, buttonWidth, buttonHeight);

    [resetBtn addTarget:self action: @selector(resetClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
    [self.view addSubview:resetBtn];
    
    CGFloat textFieldWidth =  300;
    CGFloat textFieldHeight = 40;
    CGFloat textTopViewY = 200;
    CGFloat textTopViewX = 50;
 
    
    _firstNameField = [[UITextField alloc] initWithFrame:CGRectMake( textTopViewX, textTopViewY, textFieldWidth, textFieldHeight)];
    
    _firstNameField.tag = 0;
    _firstNameField.placeholder = @"First Name:";
    _firstNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    _firstNameField.keyboardType = UIKeyboardTypeDefault;
    _firstNameField.returnKeyType = UIReturnKeyNext;
    
    _firstNameField.delegate = self;
    
    [self.view addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc] initWithFrame:CGRectMake( textTopViewX, textTopViewY + 50, textFieldWidth, textFieldHeight)];
    
    _lastNameField.tag = 1;
    _lastNameField.placeholder = @"Last Name:";
    _lastNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    _lastNameField.keyboardType = UIKeyboardTypeDefault;
    _lastNameField.returnKeyType = UIReturnKeyNext;
    
    _lastNameField.delegate = self;
    
    [self.view addSubview:_lastNameField];
    
    
    _numberField = [[UITextField alloc] initWithFrame:CGRectMake( textTopViewX, textTopViewY + 100, textFieldWidth, textFieldHeight)];
    
    _numberField.tag = 2;
    _numberField.placeholder = @"Phone Number:";
    _numberField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _numberField.borderStyle = UITextBorderStyleRoundedRect;
    _numberField.keyboardType = UIKeyboardTypeDefault;
    _numberField.returnKeyType = UIReturnKeyDone;
    
    _numberField.delegate = self;
    
    [self.view addSubview:_numberField];
    
    UIButton* submitBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [submitBtn setTitle: @"Submit" forState: UIControlStateNormal];
    submitBtn.frame = CGRectMake( textTopViewX , textTopViewY + 150, screen.size.width - textTopViewX * 2, 30);
    [submitBtn addTarget:self action: @selector(onSubmit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: submitBtn];
    
    
    
    
}


- (void) clickMe: (id)sender {
    NSLog( @"OK Button onClick." );
    old_label = _label.text;
    _label.text = @"Hello, World";
}

- (void) resetClick: (id)sender {
    NSLog( @"Reset Button onClick." );
    _label.text = old_label;
}

- (void) onSubmit: (id)sender {
    NSLog( @"Submit Button onClick." );
    NSLog(@"First Name: %@, Last Name: %@, Phone Number: %@", _firstNameField.text, _lastNameField.text, _numberField.text);
}


// Text Field begin
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"RootViewController:viewWillAppear");
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object: nil];
    NSLog(@"RootViewController:viewWillAppear Done");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"RootViewController:viewWillDisappear");
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardWillHideNotification object:nil];
    NSLog(@"RootViewController:viewWillDisappear Done");
}

#pragma mark

- (void) keyboardWillShow: (NSNotification *) notification {
    NSLog(@"RootViewController:keyboardWillShow");
}


- (void) keyboardWillHide: (NSNotification *) notification {
    NSLog(@"RootViewController:keyboardWillHide");
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog( @"textField.txt = %@ (%ld) ", textField.text, textField.tag );
    if ( textField.tag == 0 ) {
        [[self.view viewWithTag: textField.tag + 1]  becomeFirstResponder];
    } else if (textField.tag == 1) {
        [[self.view viewWithTag: textField.tag + 1]  becomeFirstResponder];
    }
    
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"RootViewController:shouldChangeCharactersInRange textField.tag = %ld", textField.tag);
    NSLog(@"RootViewController:shouldChangeCharactersInRange => string = %@", string);
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}

// Text Field end


@end
