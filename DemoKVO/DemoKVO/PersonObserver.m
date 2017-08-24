//
//  PersonObserver.m
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import "PersonObserver.h"

@implementation PersonObserver


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"]) {
        Class classInfo = (__bridge Class)context;
        NSString *className = [NSString stringWithCString:object_getClassName(classInfo) encoding:NSUTF8StringEncoding];
        
        NSLog(@" >> class: %@, Age changed", className);
        NSLog(@" old age is %@", [change objectForKey:@"old"]);
        NSLog(@" new age is %@", [change objectForKey:@"new"]);
    }else if([keyPath isEqualToString:@"info"])
    {
        Class classInfo = (__bridge Class)context;
        NSString *className = [NSString stringWithCString:object_getClassName(classInfo) encoding:NSUTF8StringEncoding];
        NSLog(@" >> class: %@, Info changed", className);
        NSLog(@" old info is %@", [change objectForKey:@"old"]);
        NSLog(@" new info is %@", [change objectForKey:@"new"]);
        
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}
@end
