//
//  MSGViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGViewController.h"

@interface MSGViewController ()

@end

@implementation MSGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MSGAddTaskViewController class]]) {
        MSGAddTaskViewController *addTaskVC = segue.destinationViewController;
        addTaskVC.delegate = self;
    }
    
}
- (IBAction)addTaskButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toAddTaskVC" sender:sender];
}

- (IBAction)reorderButtonPressed:(UIBarButtonItem *)sender {
}

#pragma mark - MSGAddTaskViewControllerDelegate
-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didAddTask
{
   
}

@end
