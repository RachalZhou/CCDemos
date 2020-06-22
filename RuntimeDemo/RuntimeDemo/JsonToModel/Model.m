//
//  Model.m
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import "Model.h"
#import <objc/runtime.h>

@implementation Model

// initialize
+ (instancetype)modelWithDictionary:(NSDictionary *)dic {
    
    id objc = [[self alloc] init];
    
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        const char *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:name];
        
        const char *type = ivar_getTypeEncoding(ivar);
        NSString *ivarType = [NSString stringWithUTF8String:type];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        NSString *key = [ivarName substringFromIndex:1];// ivarName首位为'_'
        id idkey = [self customPropertyMapper][key];
        if (idkey == nil) {
            idkey = key;
        }
        
        id value = dic[idkey];
        
        // 处理属性为字典的情况
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            Class clazz = NSClassFromString(ivarType);
            if (clazz) {
                value = [clazz modelWithDictionary:value];
            }
        }
        
        // 处理属性是数组的情况
        if ([value isKindOfClass:[NSArray class]]) {
            NSString *type = [self containsModelArray][key];
            Class clazz = NSClassFromString(type);
            
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *dict in value) {
                id item = [clazz modelWithDictionary:dict];
                [array addObject:item];
            }
            value = array;
        }
        
        // KVC
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    
    return objc;
}

#pragma mark - optional

// 若需要，以下两方法由子类重写
+ (NSDictionary *)containsModelArray { return @{}; }
+ (NSDictionary *)customPropertyMapper { return @{}; }

#pragma mark - 编/解码

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {

        // 遍历成员变量
        unsigned int count;
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {

            Ivar ivar = ivarList[i];
            const char *ivarName = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:ivarName];
            
            // 解码
            id value = [aDecoder decodeObjectForKey:key];
            value = value == nil ? @"" : value;
            [self setValue:value forKey:key];
        }
        
        free(ivarList);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{

    // 遍历成员变
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:ivarName];
        
        // 编码
        NSString *value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivarList);
}

@end
