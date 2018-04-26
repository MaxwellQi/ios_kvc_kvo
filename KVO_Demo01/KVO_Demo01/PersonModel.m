//
//  PersonModel.m
//  KVO_Demo01
//
//  Created by qi on 2018/4/26.
//  Copyright © 2018 tvu. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (NSMutableArray *)chinesePeople
{
    if (!_chinesePeople) {
        _chinesePeople = [NSMutableArray array];
    }
    return _chinesePeople;
}

- (void)addChinesePerson:(id)person
{
    [[self chinesePeople] addObject:person];
}

- (void)insertChinesePerson:(id)person index:(NSUInteger)perIndex
{
    [[self chinesePeople] insertObject:person atIndex:perIndex];
}

- (void)addChinesePersons:(NSArray<id> *)persons
{
    [[self chinesePeople] addObjectsFromArray:persons];
}

- (void)addChinesePersonsOnce:(NSArray<id> *)persons
{
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.chinesePeople.count, persons.count)];
    [[self chinesePeople] insertObjects:persons atIndexes:set];
}

- (void)removeChinesePersonAt:(NSInteger)index
{
    if (index >= [self chinesePeople].count) {
        return;
    }
    [[self chinesePeople] removeObjectAtIndex:index];
}

- (NSMutableArray *)chinesePeopleArray
{
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(chinesePeople))];
}

@end
