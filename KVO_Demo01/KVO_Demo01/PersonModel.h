//
//  PersonModel.h
//  KVO_Demo01
//
//  Created by qi on 2018/4/26.
//  Copyright © 2018 tvu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject
@property (nonatomic,strong) NSMutableArray *chinesePeople;

- (void)addChinesePerson:(id)person;
- (void)insertChinesePerson:(id)person index:(NSUInteger)perIndex;
- (void)addChinesePersons:(NSArray<id> *)persons;
- (void)addChinesePersonsOnce:(NSArray<id> *)persons;
- (void)removeChinesePersonAt:(NSInteger)index;
- (NSMutableArray *)chinesePeopleArray;
@end
