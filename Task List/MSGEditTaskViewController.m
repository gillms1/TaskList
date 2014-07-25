//
//  MSGEditTaskViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGEditTaskViewController.h"

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
    self.taskNameTextField.text = self.task.taskTitle;
    self.taskDetailTextView.text = self.task.taskDescription;
    [self.taskDatePicker setDate:self.task.taskDate animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
  
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    
    [self updateTask];
    [self.delegate saveTask];
}


-(void)updateTask
{
    self.task.taskTitle = self.taskNameTextField.text;
    self.task.taskDescription = self.taskDetailTextView.text;
    self.task.taskDate = self.taskDatePicker.date;
    
}

@end
