//
//  Person.m
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import "Person.h"

/* 手动实现键值观察 */

@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        age = 5;
    }
    return self;
}

- (int)age
{
    return age;
}

- (void)setAge:(int)tage
{
    [self willChangeValueForKey:@"age"];
    age = tage;
    [self didChangeValueForKey:@"age"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"age"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

@end
