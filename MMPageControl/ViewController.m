//
//  ViewController.m
//  MMPageControl
//
//  Created by imac on 16/3/1.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "MMPageControll.h"
@interface ViewController ()
@property(nonatomic,strong)MMPageControll*pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMPageControll *pageControl = [[MMPageControll alloc]initWithFrame:CGRectMake(0,100, self.view.width, 100) pageSum:6];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.pageControl.currentPage = 2;
    self.pageControl.pageSum = 4;
    
}



@end
