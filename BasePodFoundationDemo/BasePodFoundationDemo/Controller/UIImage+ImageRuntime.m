//
//  UIImage+ImageRuntime.m
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/21.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "UIImage+ImageRuntime.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation UIImage (ImageRuntime)





/**
 
 load方法: 把类加载进内存的时候调用,只会调用一次
 
 方法应先交换，再去调用
 
 */

+(void)load {
  
  //获取UIImage imageNamed 方法
    
    // class_getClassMethod（获取某个类的方法）
    
    Method imageNameMethod  = class_getClassMethod(self, @selector(imageNamed:));
    
    //获取自定义方法
    Method ln_imageNamed = class_getClassMethod(self, @selector(ln_imageNamed:));
    
    // 3.交换方法地址，相当于交换实现方式;「method_exchangeImplementations 交换两个方法的实现」
    method_exchangeImplementations(imageNameMethod, ln_imageNamed);
    
   
    
}
// 加载图片 且 带判断是否加载成功
+ (UIImage *)ln_imageNamed:(NSString *)name {
    UIImage  *image = [UIImage ln_imageNamed:name];
    if (image) {
        NSLog(@"runtime添加额外功能--加载成功");
    }else {
         NSLog(@"runtime添加额外功能--加载失败");
    }
    return image;
}
@end
