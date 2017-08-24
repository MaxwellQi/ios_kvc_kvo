//
//  Student.m
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize age;

- (id)init
{
    self = [super init];
    if (self) {
        age = 15;
    }
    return self;
}
@end
