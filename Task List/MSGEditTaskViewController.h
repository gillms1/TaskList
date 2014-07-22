//
//  MSGEditTaskViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSGEditTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *taskDatePicker;


- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender;
@end
