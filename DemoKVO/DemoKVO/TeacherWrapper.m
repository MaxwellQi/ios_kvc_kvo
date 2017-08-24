//
//  TeacherWrapper.m
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import "TeacherWrapper.h"
#import "Teacher.h"

@implementation TeacherWrapper

- (id)init:(Teacher *)aTeacher
{
    self = [super init];
    if (self) {
        _teacher = aTeacher;
    }
    return self;
}

- (NSString *)info
{
    return [[NSString alloc] initWithFormat:@"%d#%d", [_teacher grade], [_teacher age]] ;
}

- (void)setInfo:(NSString *)theInfo
{
    NSArray *array = [theInfo componentsSeparatedByString:@"#"];
    [_teacher setGrade:[[array objectAtIndex:0] intValue]];
    [_teacher setAge:[[array objectAtIndex:1] intValue]];
}

+ (NSSet *)keyPathsForValuesAffectingInfo
{
    NSSet * keyPaths = [NSSet setWithObjects:@"teacher.age", @"teacher.grade", nil];
    return keyPaths;
}

@end
