//
//  ViewController.m
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonObserver.h"
#import "Student.h"
#import "TeacherWrapper.h"
#import "Teacher.h"
#import "Chinese.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /** KVO
    
    PersonObserver *observer = [[PersonObserver alloc] init];
    
    Person *person = [[Person alloc] init];
    [person addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)([Person class])];
    [person setAge:10];
//    [person setValue:[NSNumber numberWithInt:10] forKey:@"age"];
    [person removeObserver:observer forKeyPath:@"age"];
    
    
    Student *student = [[Student alloc] init];
    [student addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void* _Nullable)([Student class])];
    [student setAge:18];
    [student removeObserver:observer forKeyPath:@"age"];
    
    

    
    
    Teacher *teacher = [[Teacher alloc] init];
    TeacherWrapper *wrapper = [[TeacherWrapper alloc] init:teacher];
    [wrapper addObserver:observer forKeyPath:@"info" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void* _Nullable)([TeacherWrapper class])];
    [teacher setAge:30];
    [teacher setGrade:1];
    [wrapper removeObserver:observer forKeyPath:@"info"];
    
    */
    
    Chinese *chinese = [Chinese new];
    [chinese log];
    
    // 设置 readonly value
    [chinese setValue:@"Jack" forKey:@"name"];
    
    // 设置 private value
    [chinese setValue:@24 forKey:@"age"];
    [chinese setValue:@1 forKey:@"male"];
    [chinese log];
    
    
    // 获取 readonly value
    NSLog(@"name: %@", [chinese valueForKey:@"_name"]);
    
    // 获取 private value
    NSLog(@"age: %d", [[chinese valueForKey:@"_age"] intValue]);
    
    NSLog(@"male: %d", [[chinese valueForKey:@"isMale"] boolValue]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
