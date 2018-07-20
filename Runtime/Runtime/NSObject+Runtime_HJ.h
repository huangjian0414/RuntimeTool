//
//  NSObject+Runtime_HJ.h
//  Runtime
//
//  Created by huangjian on 2018/7/20.
//  Copyright © 2018年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime_HJ)

/**
 获取成员变量，包括属性生成的成员变量
 */
+(NSArray *)getIvarList;
/**
 获取类的属性列表，包括私有和公有属性，也包括分类中的属性
 */
+ (NSArray *)getPropertyList;
/**
 获取对象方法列表：包括getter, setter, 分类中的方法等
 */
+ (NSArray *)getInstanceMethodList;

/**
 获取类方法列表 包括分类里面的
 */
+ (NSArray *)getClassMethodList;

/**
 获取协议列表，包括.h .m 和分类里的
 */
+ (NSArray *)getProtocolList;

/**
 添加一个方法
 */
+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;

/**
 实例方法交换
 */
+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

/**
 类方法交换
 */
+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
@end
