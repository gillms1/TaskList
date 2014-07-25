//
//  MSGDetailTaskViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGDetailTaskViewController.h"

@interface MSGDetailTaskViewController ()

@end

@implementation MSGDetailTaskViewController

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
    self.taskTitleLabel1.text = self.task.taskTitle;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    self.taskDateLabel2.text = [dateFormatter stringFromDate:self.task.taskDate];
    
    
    self.taskDetailLabel3.text = self.task.taskDescription;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MSGEditTaskViewController class]]){
        
        MSGEditTaskViewController *editTaskVC = segue.destinationViewController;
        editTaskVC.task = sender;
        editTaskVC.delegate = self;
    }
    
}

- (IBAction)editButtonPressed:(UIBarButtonItem *)sender {
    
    [self performSegueWithIdentifier:@"toEditTaskVC" sender:self.task];
}

-(void)saveTask
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    self.taskTitleLabel1.text = self.task.taskTitle;
    self.taskDetailLabel3.text = self.task.taskDescription;
    self.taskDateLabel2.text = [formatter stringFromDate:self.task.taskDate];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate updateTaskFromEdit];
}

@end
