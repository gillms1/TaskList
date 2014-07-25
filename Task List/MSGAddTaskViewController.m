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
    
    self.addTaskTextField.delegate = self;
    self.addTaskTextView.delegate = self;
    
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
    
 /*   NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy"];
    
    NSString *dateString = [dateFormatter stringFromDate:self.addTaskDatePicker.date];
    
    NSDictionary *taskData = [[NSDictionary alloc]initWithObjectsAndKeys:self.addTaskTextField.text,@"task",
                                                                self.addTaskTextView.text, @"description",
                                                                dateString, @"date",
                                                                NO, @"completion", nil];*/
    
    MSGTaskModel *task = [[MSGTaskModel alloc]init];
    task.taskTitle = self.addTaskTextField.text;
    task.taskDate = self.addTaskDatePicker.date;
    task.taskDescription = self.addTaskTextView.text;
    task.taskCompleted = NO;
    
    return  task;
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.addTaskTextField resignFirstResponder];
    return YES;
}


#pragma mark - Navigation
- (IBAction)cancelTaskButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)addTaskButtonPressed:(UIButton *)sender {
    
    [self.delegate didAddTask:[self createTask]];
    
}


@end
