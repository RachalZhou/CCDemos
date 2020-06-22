//
//  Person.m
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person

+ (NSDictionary *)containsModelArray {
    return @{@"frends":@"Frend"};
}

+ (NSDictionary *)customPropertyMapper {
    return @{@"birthday":@"birth"};
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{name:%@, age:%@, address:%@, birthday:%@, sex:%@, phone:%@,  frends:%@}", self.name, self.age, self.address, self.birthday, self.sex, self.phone.description, self.frends];
}

@end
