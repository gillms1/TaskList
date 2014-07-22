//
//  MSGTaskModel.h
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSGTaskModel : NSObject

@property (strong, nonatomic) NSString *taskTitle;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSDate *taskDate;
@property (nonatomic) BOOL taskCompleted;

-(id)initWithData:(NSDictionary *)data;

@end
