//
//  Phone.m
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (NSString *)description {
    return [NSString stringWithFormat:@"{brand:%@, version:%@}",self.brand, self.version];
}

@end
