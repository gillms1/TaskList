//
//  MSGDetailTaskViewController.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSGDetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel1;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLabel2;
@property (strong, nonatomic) IBOutlet UILabel *taskDetailLabel3;

- (IBAction)editButtonPressed:(UIBarButtonItem *)sender;
@end
