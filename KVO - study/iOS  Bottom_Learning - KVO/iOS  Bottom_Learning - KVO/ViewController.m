//
//  ViewController.m
//  iOS  Bottom_Learning - KVO
//
//  Created by 岳靖翔 on 2020/2/2.
//  Copyright © 2020 岳靖翔. All rights reserved.
//

#import "ViewController.h"
#import "YJXPerson.h"
@interface ViewController ()
@property (strong, nonatomic) YJXPerson*person1;
@property (strong, nonatomic) YJXPerson *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[YJXPerson alloc] init];
    self.person1.age = 1;

    self.person2 = [[YJXPerson alloc] init];
    self.person2.age = 2;
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person1.age = 20;
    self.person2.age = 20;
    
  
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
  
}

// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}


@end
