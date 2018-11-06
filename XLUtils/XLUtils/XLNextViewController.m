//
//  XLNextViewController.m
//  XLUtils
//
//  Created by vipkid on 2018/11/6.
//  Copyright © 2018年 StarUnion. All rights reserved.
//

#import "XLNextViewController.h"
#import "NSTimer+WeakTimer.h"
/**
 * NSTimer 循环引用测试
 */

@interface XLNextViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation XLNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 50, 60, 60);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *start_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    start_btn.frame = CGRectMake(30, 200, 100, 60);
    start_btn.backgroundColor = [UIColor redColor];
    [start_btn setTitle:@"start timer" forState:UIControlStateNormal];
    [start_btn addTarget:self action:@selector(startTimerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start_btn];
    
    UIButton *stop_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    stop_btn.frame = CGRectMake(self.view.frame.size.width - 30 - 100, 200, 100, 60);
    stop_btn.backgroundColor = [UIColor redColor];
    [stop_btn setTitle:@"stop timer" forState:UIControlStateNormal];
    [stop_btn addTarget:self action:@selector(pauseTimerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stop_btn];
    
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:@"timer" repeats:YES];
    
    NSTimer *timer = [NSTimer weak_scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:@"my timer" repeats:YES];
    self.timer = timer;
    
    [self.timer setFireDate:[NSDate distantFuture]];
    
}

- (void)backAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)startTimerAction:(UIButton *)sender {
    [self.timer setFireDate:[NSDate distantPast]];
    
}

- (void)pauseTimerAction:(UIButton *)sender {
    [self.timer setFireDate:[NSDate distantFuture]];

}
    
- (void)timeAction:(NSTimer *)timer {
    NSLog(@"%@", timer.userInfo);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.timer invalidate];
}

- (void)dealloc {
    NSLog(@"%@ - dealloc", NSStringFromClass([self class]));
}

@end
