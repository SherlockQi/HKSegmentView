//
//  ViewController.m
//  HKSegmentView
//
//  Created by hosa on 2017/8/18.
//  Copyright © 2017年 Heikki. All rights reserved.
//

#import "ViewController.h"
#import "HKSegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKSegmentView *view = [[HKSegmentView alloc]initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 40)];
    view.titileS = @[@"私教课",@"团操课",@"旅游课",@"跑操课"];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
