//
//  MMPageControll.m
//  MMPageControl
//
//  Created by imac on 16/3/1.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "MMPageControll.h"
#import "UIView+Extension.h"

#define MMPageControll_DefaultWide 12
#define MMPageControll_DefaultHeight MMPageControll_DefaultWide

#define MMPageControll_BigWide 20
#define MMPageControll_BigHeight MMPageControll_BigWide
#define MMPageControll_DefaultMargin 10
@interface MMPageControll()


@property(nonatomic,assign)CGFloat lastBtnXForOdd;
@property(nonatomic,assign)CGFloat lastBtnXForEven;
@property(nonatomic,strong)UIButton*lastSelectedBtn;

@end
@implementation MMPageControll

-(instancetype)initWithFrame:(CGRect)frame pageSum:(NSInteger )sum{
    self = [super initWithFrame:frame];
    if (self) {
        _pageSum = sum;
        self.backgroundColor = [UIColor redColor];
        [self setupSubViewsWithSum:sum];
    }
    return self;
}
/** 初始化创建 */
-(void)setupSubViewsWithSum:(NSInteger )sum{
    for (int i=0; i< sum; i++)
    {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:@"QQ20151020-1"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"QQ20151021-1"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickPageControlBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)setPageSum:(NSInteger)pageSum{
    if (_pageSum != pageSum) {
        for (UIView *view  in self.subviews) {
            [view removeFromSuperview];
        }
        [self setupSubViewsWithSum:pageSum];
        _pageSum = pageSum;
    }else{
    }
    [self setCurrentPage:self.currentPage];
}

-(void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    UIButton *btn = self.subviews[currentPage];
    [self clickPageControlBtn:btn];
}

-(void)clickPageControlBtn:(UIButton *)btn{
    [UIView animateWithDuration:0.2 animations:^{
        self.lastSelectedBtn.selected = NO;
        btn.selected = !btn.selected;
        self.lastSelectedBtn = btn;
//        self.lastSelectedBtn.size = CGSizeMake(MMPageControll_DefaultWide, MMPageControll_DefaultHeight);
//        btn.size = CGSizeMake(MMPageControll_BigWide, MMPageControll_BigHeight);
//        self.lastSelectedBtn = btn;
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i=0; i< self.pageSum; i++)
    {
        if (self.pageSum %2 == 0) {
            [self setupSubViewsFrameWhenEvennumberWith:self.pageSum];
        }else{
            [self setupSubViewsFrameWhenOddnumberWith:self.pageSum];
        }
    }
    
}
/** 奇数 */
-(void)setupSubViewsFrameWhenOddnumberWith:(NSInteger )sum{
    NSInteger middleOne = 0.5*(sum-1);
    CGFloat firstoneX = self.width*0.5 - ((middleOne - 0)*(MMPageControll_DefaultWide+MMPageControll_DefaultMargin) + MMPageControll_DefaultWide * 0.5);
    CGFloat firstoneY = 0.5*(self.height - MMPageControll_DefaultHeight);
    for (int i=0; i< sum; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(firstoneX +i*(MMPageControll_DefaultWide+MMPageControll_DefaultMargin), firstoneY, MMPageControll_DefaultWide, MMPageControll_DefaultHeight);
        btn.layer.cornerRadius = btn.width/2;
        btn.layer.masksToBounds = YES;
    }
}
/** 偶数 */
-(void)setupSubViewsFrameWhenEvennumberWith:(NSInteger )sum{
    CGFloat firstoneX = self.width*0.5 - (sum*0.5*(MMPageControll_DefaultMargin+MMPageControll_DefaultWide)-MMPageControll_DefaultMargin/2);
    CGFloat firstoneY = 0.5*(self.height - MMPageControll_DefaultHeight);
    for (int i=0; i< sum; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(firstoneX +i*(MMPageControll_DefaultWide+MMPageControll_DefaultMargin), firstoneY, MMPageControll_DefaultWide, MMPageControll_DefaultHeight);
        btn.layer.cornerRadius = btn.width/2;
        btn.layer.masksToBounds = YES;
    }
}

@end
