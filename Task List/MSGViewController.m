//
//  MSGViewController.m
//  Task List
//
//  Created by Sunny on 21/07/2014.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "MSGViewController.h"

@interface MSGViewController ()

@end

@implementation MSGViewController

- (NSMutableArray *)taskObjects
{
    if (!_taskObjects){
        _taskObjects = [[NSMutableArray alloc]init];
    }
    
    return _taskObjects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *storedTasks = [[NSUserDefaults standardUserDefaults]objectForKey:TASK_OBJECTS_KEY];
    
    for (NSDictionary *task in storedTasks) {
       [self.taskObjects addObject:[self taskObjectCustomInit:task]];
    }
    NSLog(@"%@", storedTasks);
    
    self.mainViewTableView.dataSource = self;
    self.mainViewTableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[MSGAddTaskViewController class]]) {
        MSGAddTaskViewController *addTaskVC = segue.destinationViewController;
        addTaskVC.delegate = self;
    } else if ([segue.destinationViewController isKindOfClass:[MSGDetailTaskViewController class]]) {
        MSGDetailTaskViewController *detailTaskVC = segue.destinationViewController;
        detailTaskVC.task = sender;
        detailTaskVC.delegate = self;
    }
    
}
- (IBAction)addTaskButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toAddTaskVC" sender:sender];
}

- (IBAction)reorderButtonPressed:(UIBarButtonItem *)sender {
    
    if (self.mainViewTableView.editing) {
        [self.mainViewTableView setEditing:NO animated:YES];
    } else {
        [self.mainViewTableView setEditing:YES animated:YES];
    }
    
}

#pragma mark - MSGDetailTaskViewControllerDelegate
-(void)updateTaskFromEdit
{
    
    [self saveTasks:self.taskObjects];
    [self.mainViewTableView reloadData];
    
}

#pragma mark - MSGAddTaskViewControllerDelegate
-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didAddTask:(MSGTaskModel *)task
{
    [self.taskObjects addObject:task];
    
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY]mutableCopy];
    
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc]init];
    }
    
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsPropertyList:task]];
    
    [[NSUserDefaults standardUserDefaults]setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
  
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.mainViewTableView reloadData];
   
}

#pragma mark - Helper methods

-(NSDictionary *)taskObjectAsPropertyList:(MSGTaskModel *)taskObject
{
    
    NSDictionary *taskData = @{TASK : taskObject.taskTitle, TASK_DESCRIPTION : taskObject.taskDescription, TASK_DATE : taskObject.taskDate, TASK_COMPLETION : @(taskObject.taskCompleted)};
    
    return taskData;
}

-(MSGTaskModel *)taskObjectCustomInit:(NSDictionary *)taskDictionary
{
    //[[MSGTaskModel alloc]initWithData:taskData];
    MSGTaskModel *task = [[MSGTaskModel alloc]initWithData:taskDictionary];
    return task;
}

-(BOOL)isDateGreaterThanDate:(NSDate *)date and:(NSDate *)toDate
{
    if ([date timeIntervalSince1970] > [toDate timeIntervalSince1970]) {
        return YES;
        NSLog(@"%@", @"YES");
    } else {
        return NO;
        NSLog(@"%@", @"NO");
    }
    
}

-(void)updateCompletionOfTask:(MSGTaskModel *)task forIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *tasksObjectAsPropertyList = [[[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY]mutableCopy];
    
    [tasksObjectAsPropertyList removeObjectAtIndex:indexPath.row];
    
    if (task.taskCompleted) {
        task.taskCompleted = NO;
    } else {
        task.taskCompleted = YES;
    }
    
    [tasksObjectAsPropertyList insertObject:[self taskObjectAsPropertyList:task] atIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults] setObject:tasksObjectAsPropertyList forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self.mainViewTableView reloadData];
}

- (void)saveTasks:(NSMutableArray *)tasks
{
    
    NSMutableArray *newTasksList = [[NSMutableArray alloc]init];
    
    for (MSGTaskModel *task in tasks) {
       NSDictionary *taskAsDictionary = [self taskObjectAsPropertyList:task];
        [newTasksList addObject:taskAsDictionary];
    }
   
    [[NSUserDefaults standardUserDefaults]setObject:newTasksList forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

#pragma mark - tableview methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSLog(@"%@", [self.taskObjects objectAtIndex:indexPath.row]);
    
    MSGTaskModel *task = [self.taskObjects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = task.taskTitle;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.taskDate];
    cell.detailTextLabel.text = stringFromDate;
    
    if (task.taskCompleted) {
        cell.backgroundColor = [UIColor greenColor];
    } else if ([self isDateGreaterThanDate:[NSDate date] and:task.taskDate]) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateCompletionOfTask:self.taskObjects[indexPath.row] forIndexPath:indexPath];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.taskObjects removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *newTaskObjectsData = [[NSMutableArray alloc]init];
        
        for (MSGTaskModel *task in self.taskObjects) {
            [newTaskObjectsData addObject:[self taskObjectAsPropertyList:task]];
        }
        
        [[NSUserDefaults standardUserDefaults]setObject:newTaskObjectsData forKey:TASK_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    MSGTaskModel *selectedModel = self.taskObjects[sourceIndexPath.row];
    
    [self.taskObjects removeObjectAtIndex:sourceIndexPath.row];
    [self.taskObjects insertObject:selectedModel atIndex:destinationIndexPath.row];
    
    [self saveTasks:self.taskObjects];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    MSGTaskModel *selectedModel = [[MSGTaskModel alloc]init];
    selectedModel = self.taskObjects[indexPath.row];
    [self performSegueWithIdentifier:@"toDetailTaskVC" sender:selectedModel];
}



@end
