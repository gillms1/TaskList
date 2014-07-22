//
//  MSGViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSGAddTaskViewController.h"

@interface MSGViewController : UIViewController <MSGAddTaskViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UITableView *mainViewTableView;
@property (strong, nonatomic) NSMutableArray *taskObjects;

- (IBAction)addTaskButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)reorderButtonPressed:(UIBarButtonItem *)sender;

@end
