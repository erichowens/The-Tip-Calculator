//
//  TipViewController.m
//  The Tip Calculator
//
//  Created by Erich Owens on 10/8/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;

- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self updateValues];
  self.title = @"Tip Calculator";
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
  
  // load default percentage, select that
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  int intValue = [defaults integerForKey:@"default_tip_index"];
  _tipControl.selectedSegmentIndex = intValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
  [self.billTextField resignFirstResponder];
  [self updateValues];
}

- (void)updateValues {
  float billAmount = [self.billTextField.text floatValue];
  
  NSArray* tipValues = @[@(0.1), @(0.15), @(0.2)];
  float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
  float totalAmount = tipAmount + billAmount;
  
  self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
  self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
  [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
