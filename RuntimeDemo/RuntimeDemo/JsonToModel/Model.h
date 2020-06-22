//
//  Model.h
//  RuntimeDemo
//
//  Created by 周日朝 on 2020/6/22.
//  Copyright © 2020 ZRC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject<NSCoding>

// initialize

+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

/// 支持数组嵌套：模型属性中包含数组，重写该方法，指明数组中模型的类名
/// 如'return @{@"users":@"User"}'，'users'为属性名，'User'为数组中模型的类名
+ (NSDictionary *)containsModelArray;

/// 支持自定义属性名：名称映射，重写该方法
/// 如'return @{@"birthday":@"birth"}'，'birth'为json中字段，'birthday'为模型属性
+ (NSDictionary *)customPropertyMapper;

@end

NS_ASSUME_NONNULL_END
