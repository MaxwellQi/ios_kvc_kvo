//
//  ViewController.m
//  KVO_Demo01
//
//  Created by qi on 24/04/2018.
//  Copyright © 2018 tvu. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"

@interface Model : NSObject
@property (strong,nonatomic)NSMutableArray *modelArray;
@end

@implementation Model

-(NSMutableArray *)modelArray{
    if(!_modelArray){
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

@end

@interface ViewController ()

@property (strong,nonatomic) Model *model;
@property (nonatomic,strong) PersonModel *personModel;

@end

@implementation ViewController

- (Model*)model
{
    if (!_model) {
        _model = [Model new];
        [_model addObserver:self forKeyPath:@"modelArray" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _model;
}

- (PersonModel *)personModel
{
    if (!_personModel) {
        _personModel = [PersonModel new];
        [_personModel addObserver:self forKeyPath:@"chinesePeople" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _personModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"modelArray"]) {
        NSLog(@"%ld",self.model.modelArray.count);
    }else if([keyPath isEqualToString:@"chinesePeople"])
    {
        NSLog(@"%ld",self.personModel.chinesePeople.count);
    }
    
}

- (IBAction)onpressedButtonAddEle:(id)sender {
    NSObject *obj = [[NSObject alloc] init];
    [[self.model mutableArrayValueForKeyPath:@"modelArray"] addObject:obj];
}

- (IBAction)onpressedButtonInserEle:(id)sender {
    NSObject *obj = [[NSObject alloc] init];
    [[self.model mutableArrayValueForKeyPath:@"modelArray"] insertObject:obj atIndex:0];
}

- (IBAction)onpressedButtonRemoveEle:(id)sender {
    
    int arrayCount = (int)[[self.model mutableArrayValueForKeyPath:@"modelArray"] count];
    if (arrayCount == 0) {
        return;
    }
    
    [[self.model mutableArrayValueForKeyPath:@"modelArray"] removeObjectAtIndex:0];
}

- (IBAction)onpressedButtonAddArray:(id)sender {
    NSArray *elementArray = @[@"1",@"2",@"3"];
    [[self.model mutableArrayValueForKeyPath:@"modelArray"] addObjectsFromArray:elementArray];
}

- (IBAction)onpressedButtonAddArrayOnce
{
    NSArray *elementArray = @[@"1",@"2",@"3"];
      NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self.model mutableArrayValueForKeyPath:@"modelArray"].count, elementArray.count)];
    [[self.model mutableArrayValueForKeyPath:@"modelArray"] insertObjects:elementArray atIndexes:set];
}

// 包装后
- (IBAction)onpressedButtonAddPerson:(id)sender {
    [self.personModel addChinesePerson:[NSObject new]];
}

- (IBAction)onpressedButtonInserPerson:(id)sender {
    [self.personModel insertChinesePerson:[NSObject new] index:0];
}

- (IBAction)onpressedButtonRemovePerson:(id)sender {
    [self.personModel removeChinesePersonAt:0];
}

- (IBAction)onpressedButtonAddPersonArray:(id)sender {
    [self.personModel addChinesePersons:@[@"zhangsan",@"lisi",@"wangwu"]];
}

- (IBAction)onpressedButtonAddPersonArrayOnce:(id)sender {
    [self.personModel addChinesePersonsOnce:@[@"dingqi",@"niuba",@"zhaoliu"]];
}

- (void)dealloc{
     [self.model removeObserver:self forKeyPath:@"modelArray"];
    [self.personModel removeObserver:self forKeyPath:@"chinesePerson"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


