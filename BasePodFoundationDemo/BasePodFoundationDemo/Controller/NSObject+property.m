//
//  NSObject+property.m
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/21.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/runtime.h>
@implementation NSObject (property)

//runtime 给系统分类添加属性

- (void)setTestname:(NSString *)Testname {
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    // object:给哪个对象添加属性
    // key:属性名称
    // value:属性值
    // policy:保存策略
    
    objc_setAssociatedObject(self, @"Testname",Testname, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get方法
- (NSString *)Testname {
    return objc_getAssociatedObject(self, @"Testname");
}
@end
