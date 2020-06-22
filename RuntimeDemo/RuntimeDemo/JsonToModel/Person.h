//
//  Person.h
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "Model.h"
#import "Phone.h"

@interface Person : Model

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong) NSArray *frends;
@property (nonatomic, strong) Phone *phone;

@end
