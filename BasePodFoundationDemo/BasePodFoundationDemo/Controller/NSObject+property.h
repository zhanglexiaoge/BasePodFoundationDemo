//
//  NSObject+property.h
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/21.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (property)
// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property(nonatomic, strong) NSString *Testname;  //runtime 给系统分类添加属性
@end
