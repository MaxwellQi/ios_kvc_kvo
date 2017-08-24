//
//  Chinese.h
//  DemoKVO
//
//  Created by zhangqi on 23/8/2017.
//  Copyright © 2017 zhangqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chinese : NSObject
{
    @private
    int _age;
}
@property (nonatomic,strong,readonly) NSString *name;
@property (nonatomic,assign,getter=isMale) BOOL male;
- (void)log;
@end
