
//
//  HomeViewController.m
//  BasePodFoundationDemo
//
//  Created by Miugodigital on 2018/6/14.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseViewController.h"
#import "NSObject+property.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
//重写 BaseViewController 方法

///// 全局的Dictionary，key 是 pthread_t， value 是 CFRunLoopRef
//static CFMutableDictionaryRef loopsDic;
///// 访问 loopsDic 时的锁


-(id)initWithParameters:(id)parameters
{
    self = [super initWithParameters:parameters];
    if (self) {
        
        NSLog(@" PushController %@",parameters);
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton *butn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    butn.frame = CGRectMake(100, 100, 80, 80);
    butn.backgroundColor =[UIColor redColor];
    [butn setTitle:@"测试" forState:UIControlStateNormal];
    [butn addTarget:self action:@selector(handleLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:butn];
    
    //runtime 交换方法
     UIImage *image = [UIImage imageNamed:@"+"];
    
    
    //给系统分类动态添加属性 调用
    NSObject *objc = [[NSObject alloc] init];
    objc.Testname = @"123";
    NSLog(@"runtime动态添加属性name==%@",objc.Testname);
    
    //runloop  10分钟刷新一下数据  开辟子线程
 //   [self setTimer];
    
    
}

- (void) setTimer{
    
    __weak HomeViewController *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%d",[NSRunLoop currentRunLoop] == [NSRunLoop mainRunLoop]);
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:60 target:weakSelf selector:@selector(tenThreadTimer:) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        
        [[NSRunLoop currentRunLoop] run];
        
    });
}
//定时器方法  每一段时间来执行某一个方法
- (void)tenThreadTimer:(NSTimer *)timer{
    NSLog(@"second thread timer count");
   
    __weak HomeViewController *weakSelf = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        //weakSelf.secondResultLabel.text = [NSString stringWithFormat:@"%ld",self.secondCount];
        
        NSLog(@"%@",@"1111111111");
        weakSelf.view.backgroundColor =[UIColor blueColor];
    });
}

//也可以使用runloop 来tabview 滑动优化
- (void)handleLogin{
    NSString * className = [NSString stringWithFormat:@"%@ViewController", @"Login"];
    BaseViewController *VC =  (BaseViewController *)self;
    
    [VC bsy_PushVC:className object:@"PushController" animate:YES completeBlock:^(id completeObj) {
        
    }];
    //  -(void)bsy_PushVC:(NSString *)classString object:(id)object animate:(BOOL)animate completeBlock:(void(^)(id completeObj))completeBlock
//    NSString * className = [NSString stringWithFormat:@"%@ViewController", @"Login"];
//    Class aVCClass = NSClassFromString(className);
    

    
//    //创建vc对象
//    BaseViewController * loginVC = [[aVCClass alloc] init];
//    
//    
//    [self.navigationController pushViewController:loginVC animated:YES];
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
