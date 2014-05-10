//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by David Bernthal on 5/10/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSelector;

- (void)saveDefaultTipValue;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultTipIndex"];
    [self.defaultTipSelector setSelectedSegmentIndex:defaultTipIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveDefaultTipValue
{
    int defaultIndex = self.defaultTipSelector.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultIndex forKey:@"defaultTipIndex"];
    [defaults synchronize];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self saveDefaultTipValue];
}

@end
