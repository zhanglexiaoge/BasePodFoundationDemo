//
//  LoginViewController.m
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/14.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong)NSString *str;

@end

@implementation LoginViewController

-(id)initWithParameters:(id)parameters
{
   // NSLog(@"%@",parameters);
    self = [super initWithParameters:parameters];
    if (self) {
        
       // NSLog(@" PushController %@",parameters);
        self.str = (NSString *)parameters;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"==== %@",self.str);
   
    [self setViewTest];
    
}
- (void)setViewTest{
    UITextField *textfild =[[ UITextField alloc]init];
    textfild.frame = CGRectMake(100, 200, 100, 60);
    [self.view addSubview:textfild];
    
    //UITextField * textOne 
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 //返回上一层
//    BaseViewController *VC =  (BaseViewController *)self;
//
//    NSLog(@"66666  %@",self.navigationController.viewControllers);
//    //NSLog(@"22222   %@",[NSMutableDictionary dictionaryWithObject:self forKey:NSStringFromClass([self class])]);
//    [VC bsy_PopVC:NSStringFromClass([self class]) childClass:[NSMutableDictionary dictionaryWithObject:self forKey:NSStringFromClass([self class])] object:@"test" animate:YES completeBlock:^(id completeObj) {
//
//     }];
    
//返回某一层
    NSString * className = [NSString stringWithFormat:@"%@ViewController", @"Home"]; //需要返回的控制器
    BaseViewController *VC =  (BaseViewController *)self;
    
    NSMutableArray *arr = [NSMutableArray new];
    
    //    遍历导航控制器中的控制器
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        
        NSMutableDictionary *dic =   [NSMutableDictionary dictionaryWithObject:vc forKey:NSStringFromClass([vc class])];
        
        [arr addObject:dic];
        
        
        
    }
    
    NSLog(@"66666  %@",self.navigationController.viewControllers);
//    [VC bsy_PopVC:NSStringFromClass([self class]) childClass:[NSMutableDictionary dictionaryWithObject:self forKey:NSStringFromClass([self class])] object:@"test" animate:YES completeBlock:^(id completeObj) {
//
//    }];
    
//    [VC bsy_PopVC:NSStringFromClass([self class]) andpopToVC:className childClass:arr object:@"test" animate:YES completeBlock:^(id completeObj) {
//
//    }];
    
    
    [VC bsy_PopVC:NSStringFromClass([self class]) andpopToVC:className childClass:[NSMutableDictionary dictionaryWithObject:self forKey:NSStringFromClass([self class])] childToClass:arr object:@"test" animate:YES completeBlock:^(id completeObj) {
        
    }];
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
