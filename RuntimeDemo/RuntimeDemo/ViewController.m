//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    Person *person = [[Person alloc] init];
    person = [Person modelWithDictionary:dic];
    NSLog(@"person is %@",person.description);
}


@end
