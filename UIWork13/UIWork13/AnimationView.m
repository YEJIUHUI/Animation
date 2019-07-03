//
//  AnimationView.m
//  UIWork13
//
//  Created by 叶久辉 on 2018/12/1.
//  Copyright © 2018年 ye. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self initsubviews];
    }return self;
}
-(void)initsubviews
{
    self.index1=0;
    self.arrayData=[NSMutableArray arrayWithObjects:@"640*872_1",@"640*872_3",@"gaoyuanyuan1",@"mmcq",@"zhaoliyin",@"gaoyuanyuan3",@"gaoyuanyuan4",@"huangshijia", nil];
    UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.bounds.size.width, self.bounds.size.height-20)];
    view.tag=777;
    view.image=[UIImage imageNamed:[self.arrayData objectAtIndex:self.index1]];
    [self addSubview:view];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(beginAnimation) userInfo:nil repeats:YES];
    _m=YES;
    
    
    
    
    
    
}
-(void)beginAnimation
{
    self.index1+=1;
    UIImageView *view=[self viewWithTag:777];
    
    if (_m==YES)
    {
        if (self.index1<self.arrayData.count)
        {
            [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                view.image=[UIImage imageNamed:[self.arrayData objectAtIndex:self.index1]];
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            self.index1=0;
            _m=NO;
            [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                view.image=[UIImage imageNamed:[self.arrayData objectAtIndex:self.index1]];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        if (self.index1<self.arrayData.count)
        {
            [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                view.image=[UIImage imageNamed:[self.arrayData objectAtIndex:self.index1]];
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            self.index1=0;
            _m=YES;
            [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                view.image=[UIImage imageNamed:[self.arrayData objectAtIndex:self.index1]];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    
    
    
    
    
}





@end
