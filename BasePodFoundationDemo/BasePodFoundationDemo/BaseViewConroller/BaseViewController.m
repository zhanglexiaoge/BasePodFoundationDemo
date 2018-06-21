//
//  BaseViewController.m
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/14.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(id)initWithParameters:(id)parameters
{
    self = [super init];
    if (self) {
    }
    return self;
}

/**
 跳转事件
 @param classString 需要跳转的控制器
 @param object 跳转的时候需要传入的参数
 @param completeBlock 跳转完成的回调
 */
-(void)bsy_PushVC:(NSString *)classString object:(id)object animate:(BOOL)animate completeBlock:(void(^)(id completeObj))completeBlock
{
    if ([classString isKindOfClass:[NSString class]]) {
        Class class = NSClassFromString(classString);
        [self.navigationController pushViewController:((UIViewController *)[[class alloc]initWithParameters:object]) animated:animate];
        if (completeBlock) {
            completeBlock(NSStringFromClass([class class]));
        }
    }else{
        if (completeBlock) {
            completeBlock(NSStringFromClass([NSError class]));
        }
        
    }
}

/**
 pop返回事件
 @param classString 需要返回控制器
 @param object 返回的时候需要传入的参数
 @param completeBlock 返回完成的回调
 */
-(void)bsy_PopVC:(NSString *)classString  childClass:(NSMutableDictionary *)childClass object:(id)object animate:(BOOL)animate completeBlock:(void(^)(id completeObj))completeBlock
{
    
    if ([classString isKindOfClass:[NSString class]]) {
        Class class = NSClassFromString(classString);
        id viewController = [childClass objectForKey:classString];
        UIViewController *vc = viewController;
        [vc.navigationController popViewControllerAnimated:animate];
        if (completeBlock) {
            completeBlock(NSStringFromClass([class class]));
        }
    }else{
        if (completeBlock) {
            completeBlock(NSStringFromClass([NSError class]));
        }
        
    }
}

/**
 pop返回某一个界面事件
 @param classString 需要返回控制器
 @param object 返回的时候需要传入的参数
 @param completeBlock 返回完成的回调
 */
//-(void)bsy_PopVC:(NSString *)classString andpopToVC:(NSString *)ToclassString childClass:(NSMutableArray *)childClass object:(id)object animate:(BOOL)animate completeBlock:(void(^)(id completeObj))completeBlock{
    -(void)bsy_PopVC:(NSString *)classString andpopToVC:(NSString *)ToclassString childClass:(NSDictionary *)childClass childToClass:(NSMutableArray *)childClassArr object:(id)object animate:(BOOL)animate completeBlock:(void(^)(id completeObj))completeBlock{
    
        if ([classString isKindOfClass:[NSString class]]) {
                Class class = NSClassFromString(classString);
             id viewController = [childClass objectForKey:classString];
             UIViewController *vc = viewController;
            NSLog(@"=== %@",childClassArr);
            if (childClassArr.count > 0 ) {
                
                for (NSDictionary *dic in childClassArr) {
                    if ([[dic allKeys] containsObject:ToclassString] && dic[ToclassString]) {
                        
                        [vc.navigationController popViewControllerAnimated:animate];
                                if (completeBlock) {
                                    completeBlock(NSStringFromClass([class class]));
                                }
                    }
                }
                
                
            }
            
            
        }
//    if ([classString isKindOfClass:[NSString class]]) {
//        Class class = NSClassFromString(classString);
//
//
//        id viewController = [childClass objectForKey:classString];
//        UIViewController *vc = viewController;
//        [vc.navigationController popViewControllerAnimated:animate];
//        if (completeBlock) {
//            completeBlock(NSStringFromClass([class class]));
//        }
//    }else{
//        if (completeBlock) {
//            completeBlock(NSStringFromClass([NSError class]));
//        }
    
 //   }
}


@end
