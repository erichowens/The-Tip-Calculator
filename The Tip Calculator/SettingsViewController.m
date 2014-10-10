//
//  SettingsViewController.m
//  The Tip Calculator
//
//  Created by Erich Owens on 10/9/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

-(IBAction)updateDefault:(id)sender;

@end

@implementation SettingsViewController
- (IBAction)updateDefault:(id)sender {
  int defaultIndex = self.defaultTipControl.selectedSegmentIndex;
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setInteger:defaultIndex forKey:@"default_tip_index"];
  [defaults synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

 tipValues[self.tipControl.selectedSegmentIndex] floatValue
 */

@end
