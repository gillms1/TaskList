//
//  MSGEditTaskViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGEditTaskViewController.h"

@interface MSGEditTaskViewController ()

@end

@implementation MSGEditTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
}
@end
