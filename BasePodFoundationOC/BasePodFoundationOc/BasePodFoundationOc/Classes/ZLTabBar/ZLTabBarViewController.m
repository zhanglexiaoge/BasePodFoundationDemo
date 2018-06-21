//
//  ZLTabBarViewController.m
//  BasePodFoundationOc
//
//  Created by Miugodigital on 2018/5/18.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "ZLTabBarViewController.h"
#import "ZLTabBar.h"

@interface ZLTabBarViewController ()

@end

@implementation ZLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setValue:[[ZLTabBar alloc] init] forKey:@"tabBar"];
    [self addAllChildViewController];
}
#pragma mark - Private Methods

// 添加全部的 childViewcontroller
- (void)addAllChildViewController
{
    
//    NSString * className = [NSString stringWithFormat:@"%@ViewController", _dataSource[indexPath.row]];
//    
//    //创建视图控制器的Class
//    //使用class间接使用类名，即使不加头文件，也能创建对象。
//    //编译器要求直接引用类名等标识符，必须拥有声明。
//    Class aVCClass = NSClassFromString(className);
//    //创建vc对象
//    UIViewController * vc = [[aVCClass alloc] init];
//    [vc performSelector:@selector(setDatArray:) withObject:[_resultData objectForKey:_dataSource[indexPath.row]]];
//    [vc performSelector:@selector(setTitle:) withObject:_dataSource[indexPath.row]]; 
    
     NSString * className = [NSString stringWithFormat:@"%@ViewController", @"Home"];
     Class aVCClass = NSClassFromString(className);
        //创建vc对象
        BaseViewController * homeVC = [[aVCClass alloc] init];
    
   // homeVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:homeVC title:@"首页" imageNamed:@"tabBar_home"];
    
//    UIViewController *homeVC = [[UIViewController alloc] init];
//    homeVC.view.backgroundColor = [UIColor redColor];
//    [self addChildViewController:homeVC title:@"首页" imageNamed:@"tabBar_home"];
    
    NSString * classNameactivity = [NSString stringWithFormat:@"%@ViewController", @"Activity"];
    Class aVCClassactivity = NSClassFromString(classNameactivity);
    //创建vc对象
    BaseViewController * activityVC = [[aVCClassactivity alloc] init];
   // activityVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:activityVC title:@"活动" imageNamed:@"tabBar_activity"];
//
    NSString * classNameFind = [NSString stringWithFormat:@"%@ViewController", @"Find"];
    Class aVCClassFind = NSClassFromString(classNameFind);
    //创建vc对象
    BaseViewController * FindVC = [[aVCClassFind alloc] init];
   // FindVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:FindVC title:@"发现" imageNamed:@"tabBar_find"];
//
     NSString * classNameMine = [NSString stringWithFormat:@"%@ViewController", @"MineT"];
    Class aVCClassMine = NSClassFromString(classNameMine);
    //创建vc对象
    BaseViewController * mineVC = [[aVCClassMine alloc] init];
   // mineVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:mineVC title:@"我的" imageNamed:@"tabBar_mine"];
}

// 添加某个 childViewController
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed
{
  ZLNavViewController *nav = [[ZLNavViewController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageNamed];
    
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
