//
//  MSGAddTaskViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGAddTaskViewController.h"
#import "MSGTaskModel.h"

@interface MSGAddTaskViewController ()

@end

@implementation MSGAddTaskViewController

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
    
    self.addTaskTextField.text = @"My first task";
    self.addTaskTextView.text = @"Task details go here";
    self.addTaskDatePicker.date = [NSDate date];
    
    [self createTask];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MSGTaskModel *)createTask;
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy"];
    
    NSString *dateString = [dateFormatter stringFromDate:self.addTaskDatePicker.date];
    
    NSDictionary *taskData = [[NSDictionary alloc]initWithObjectsAndKeys:self.addTaskTextField.text,@"task",
                                                                self.addTaskTextView.text, @"description",
                                                                dateString, @"date",
                                                                NO, @"completion", nil];
    
    MSGTaskModel *task = [[MSGTaskModel alloc]initWithData: taskData];
    NSLog(@"%@ %@ %@ %d", task.taskTitle, task.taskDate, task.taskDescription, task.taskCompleted);
    return  task;
    
}

#pragma mark - Navigation
- (IBAction)cancelTaskButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)addTaskButtonPressed:(UIButton *)sender {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
}
@end
