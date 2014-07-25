//
//  MSGAddTaskViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSGTaskModel.h"

@protocol MSGAddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddTask:(MSGTaskModel *)task;

@end

@interface MSGAddTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) id <MSGAddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *addTaskTextField;
@property (strong, nonatomic) IBOutlet UITextView *addTaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *addTaskDatePicker;


- (IBAction)cancelTaskButtonPressed:(UIButton *)sender;
- (IBAction)addTaskButtonPressed:(UIButton *)sender;
@end
