//
//  MSGDetailTaskViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSGTaskModel.h"
#import "MSGEditTaskViewController.h"

@protocol MSGDetailTaskViewControllerDelegate <NSObject>

-(void)updateTaskFromEdit;

@end

@interface MSGDetailTaskViewController : UIViewController <MSGEditTaskViewControllerDelegate>

@property (weak, nonatomic) id <MSGDetailTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel1;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLabel2;
@property (strong, nonatomic) IBOutlet UILabel *taskDetailLabel3;

@property (strong, nonatomic) MSGTaskModel *task;

- (IBAction)editButtonPressed:(UIBarButtonItem *)sender;
@end
