//
//  MSGTaskModel.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGTaskModel.h"

@implementation MSGTaskModel

-(id)init
{
    self = [self initWithData:nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self){
        self.taskTitle = data[TASK];
        self.taskDescription = data[TASK_DESCRIPTION];
        self.taskDate = data[TASK_DATE];
        self.taskCompleted = [data[TASK_COMPLETION]boolValue];
    }
    return self;
}

@end
