//
//  HKSegmentView.m
//  mask
//
//  Created by hosa on 2017/8/16.
//  Copyright © 2017年 Heikki. All rights reserved.
//

#import "HKSegmentView.h"
@interface HKSegmentView()

@property (nonatomic, strong) NSMutableArray <UILabel *> *bottomLabelS;
@property (nonatomic, strong) NSMutableArray <UILabel *> *topLabelS;
@property (nonatomic, strong) NSMutableArray <UIButton*> *buttonS;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *barView;

@end
CGFloat itemW  = 0;
@implementation HKSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bottomLabelS = @[].mutableCopy;
        _buttonS = @[].mutableCopy;
    }
    return self;
}


-(UIView *)contentView{
    if (_contentView == nil) {
        CGRect rect = self.bottomLabelS.firstObject.bounds;
        _contentView = [[UIView alloc] initWithFrame:rect];
        _contentView.backgroundColor = [UIColor redColor];
        _contentView.layer.cornerRadius = 10;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}
-(UIView *)barView{
    if (_barView == nil) {
        CGRect rect = self.bounds;
        _barView = [[UIView alloc] initWithFrame:rect];
        _barView.backgroundColor = [UIColor clearColor];
    }
    return _barView;
}
-(void)setTitileS:(NSArray<NSString *> *)titileS{
    _titileS = titileS;
    itemW = self.bounds.size.width / _titileS.count;

    for(int j = 0; j < _titileS.count; j++) {
        CGRect rect = CGRectMake(itemW * j, 0, itemW, self.bounds.size.height);
        UILabel *label = [[UILabel alloc]initWithFrame:rect];
        label.text = _titileS[j];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.textColor = [UIColor blueColor];
        [self.bottomLabelS addObject:label];
    }
    
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.barView];
    
    for(int j = 0; j < _titileS.count; j++) {
        CGRect rect = CGRectMake(itemW * j, 0, itemW, self.bounds.size.height);
        UILabel *label = [[UILabel alloc]initWithFrame:rect];
        label.text = _titileS[j];
        label.textAlignment = NSTextAlignmentCenter;
        [self.barView addSubview:label];
        label.textColor = [UIColor whiteColor];
        [self.topLabelS addObject:label];

        UIButton *button = [[UIButton alloc]initWithFrame:rect];
        button.tag = j;
        [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonS addObject:button];
    }
    
}
- (void)buttonDidClick:(UIButton *)button{

    CGFloat x = button.tag *itemW;
    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.frame = button.frame;
        self.barView.frame = CGRectMake(- x, 0, self.bounds.size.width, self.bounds.size.height);
    }];
    
}
@end
