//
//  TeacherWrapper.h
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Teacher;
@interface TeacherWrapper : NSObject
{
    @private
    Teacher * _teacher;
}
@property (nonatomic,assign) NSString* info;
@property (nonatomic,retain) Teacher *teacher;

- (id)init:(Teacher *)aTeacher;
@end
