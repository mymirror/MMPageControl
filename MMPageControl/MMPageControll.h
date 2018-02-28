//
//  MMPageControll.h
//  MMPageControl
//
//  Created by imac on 16/3/1.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMPageControll : UIView
@property(nonatomic,assign)NSInteger pageSum;
@property(nonatomic,assign)NSInteger currentPage;

-(instancetype)initWithFrame:(CGRect)frame pageSum:(NSInteger )sum;
@end
