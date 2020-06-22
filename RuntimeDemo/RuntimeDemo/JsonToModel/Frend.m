//
//  Frend.m
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "Frend.h"

@implementation Frend

- (NSString *)description {
    return [NSString stringWithFormat:@"{name:%@, age: %d}", self.name, self.age];
}

@end
