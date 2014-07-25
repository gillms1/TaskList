//
//  MSGEditTaskViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSGTaskModel.h"

@protocol MSGEditTaskViewControllerDelegate <NSObject>

-(void)saveTask;

@end

@interface MSGEditTaskViewController : UIViewController

@property (weak, nonatomic) id <MSGEditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *taskDatePicker;

@property (strong, nonatomic) MSGTaskModel *task;

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender;
@end
