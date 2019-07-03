//
//  ViewController.m
//  UIWork13
//
//  Created by 叶久辉 on 2018/12/1.
//  Copyright © 2018年 ye. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import "AutoVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#if 0
    AnimationView *v1=[[AnimationView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:v1];
#endif
    
#if 1
    self.view.backgroundColor=[UIColor whiteColor];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;

    
    
    
    
    AutoVC *da=[[AutoVC alloc]initWithTitle:@"CALayer图层" content:@[@"圆角",@"红边框"] ];
    AutoVC *da2=[[AutoVC alloc]initWithTitle:@"UIViewAnimation基础动画" content:@[@"上翻页",@"下翻页",@"左翻转",@"右翻转"] ];
    AutoVC *da3=[[AutoVC alloc]initWithTitle:@"CATransition过渡动画" content:@[@"立方体",@"推出",@"揭开",@"覆盖",@"淡出",@"吸收",@"翻转",@"波纹",@"上翻页",@"下翻页",@"镜头开",@"镜头关"] ];
    self.arrayData=[NSMutableArray arrayWithObjects:da,da2,da3, nil];
    
    self.aTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, 160, self.view.bounds.size.height-20) style:UITableViewStyleGrouped];
//    self.aTableView.backgroundColor=[UIColor clearColor];
    self.aTableView.delegate=self;
    self.aTableView.dataSource=self;
    [self.view addSubview:self.aTableView];
    //添加大图片
    self.aView=[[UIView alloc]initWithFrame:CGRectMake(180, 20, width-200, 1.2*(width-200))];
    [self.view addSubview:self.aView];
    UIImageView *view1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.aView.frame.size.width, self.aView.frame.size.height)];
    view1.backgroundColor=[UIColor whiteColor];
    view1.image=[UIImage imageNamed:@"QQ20190615-0.JPG"];
    view1.contentMode=UIViewContentModeScaleAspectFill;
    view1.clipsToBounds=YES;
    [self.aView addSubview:view1];
    //添加显示时间屏
    self.lab=[[UILabel alloc]initWithFrame:CGRectMake(self.aView.frame.origin.x, self.aView.frame.origin.y+self.aView.frame.size.height+20, self.aView.frame.size.width, 40)];
    self.lab.font=[UIFont systemFontOfSize:20];
    self.lab.textAlignment=NSTextAlignmentLeft;
    self.lab.text=@"当前动画时间:2.00";
    [self.view addSubview:self.lab];
    //添加滑块
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(self.aView.frame.origin.x, self.lab.frame.origin.y+self.lab.frame.size.height+10, self.aView.frame.size.width, 50)];
    slider.maximumValue=5.0;
    slider.minimumValue=0;
    slider.value=2;
    slider.minimumTrackTintColor=[UIColor redColor];
    slider.maximumTrackTintColor=[UIColor blueColor];
    [slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    //添加开关
    _switch=YES;
    UISwitch *switch1=[[UISwitch alloc]initWithFrame:CGRectMake(self.aView.frame.origin.x, slider.frame.origin.y+slider.frame.size.height+10, 60, 30)];
    switch1.onTintColor=[UIColor yellowColor];
    switch1.on=_switch;
    switch1.tintColor=[UIColor grayColor];
    switch1.thumbTintColor=[UIColor cyanColor];
    [switch1 addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switch1];
    
    //添加开关提示
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(switch1.frame.origin.x+60, switch1.frame.origin.y, self.aView.frame.size.width-50, 30)];
    lab2.font=[UIFont systemFontOfSize:20];
    lab2.text=@"是否恢复";
    [self.view addSubview:lab2];
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(switch1.frame.origin.x, switch1.frame.origin.y+switch1.frame.size.height+10, self.aView.frame.size.width-50, 30)];
    lab3.font=[UIFont systemFontOfSize:20];
    lab3.text=@"动画方向";
    [self.view addSubview:lab3];
    
    //添加分段控件
    UISegmentedControl *se1=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"上",@"下", @"左",@"右",nil]];
    se1.frame=CGRectMake(self.aView.frame.origin.x, lab3.frame.origin.y+lab3.frame.size.height+10, self.aView.frame.size.width, 40);
    se1.tag=999;
    [se1 addTarget:self action:@selector(seChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:se1];
    
    //动画设置
    self.animation888=[CATransition animation];
    self.animation888.duration=2;//持续时间
//    self.animation888.type=kCATransitionReveal;//动画类型
//    self.animation888.subtype=kCATransitionFromTop;//动画方向
    self.animation888.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//匀速

    
#endif
}
#pragma mark 滑块滑动
-(void)changeSlider:(UISlider*)slider
{
    self.lab.text=[NSString stringWithFormat:@"当前动画时间:%.2f",slider.value];
    self.animation888.duration=slider.value;
    self.time1=slider.value;
}
#pragma mark 开关状态改变
-(void)switchChange:(UISwitch*)switch1
{
    _switch=switch1.isOn;
}
#pragma mark 分段控制器改变
-(void)seChange:(UISegmentedControl*)seg
{
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
            self.animation888.subtype=kCATransitionFromTop;//动画方向上
        }
            break;
        case 1:
        {
            self.animation888.subtype=kCATransitionFromBottom;//动画方向上
        }
            break;
        case 2:
        {
            self.animation888.subtype=kCATransitionFromRight;//动画方向左
        }
            break;
        case 3:
        {
            self.animation888.subtype=kCATransitionFromLeft;//动画方向右
        }
            break;
        default:
            nil;
            break;
    }
}



-(void)setAnimation1:(NSIndexPath*)indexPath
{
    if (indexPath.row==0) {//圆角
        self.aView.layer.cornerRadius=20;
        self.aView.layer.masksToBounds=YES;
    }
    if (indexPath.row==1) {//红边框
        self.aView.layer.borderWidth = 1;
        self.aView.layer.borderColor = [UIColor redColor].CGColor;
    }
    if (_switch) {
        [self performSelector:@selector(huifu) withObject:nil afterDelay:2];
    }
}

-(void)huifu
{
    self.aView.layer.cornerRadius=0;
    self.aView.layer.borderWidth=0;
}


-(void)setAnimation2:(NSIndexPath*)indexPath
{
    [self.aView exchangeSubviewAtIndex:0 withSubviewAtIndex:0];
    if (indexPath.row==0) {//上翻页
        [UIView transitionWithView:self.aView duration:self.animation888.duration options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [UIView setAnimationRepeatAutoreverses:self->_switch];
        } completion:^(BOOL finished) {
        }];
    }
    if (indexPath.row==1) {//下翻页
        [UIView transitionWithView:self.aView duration:self.animation888.duration options:UIViewAnimationOptionTransitionCurlDown animations:^{
            [UIView setAnimationRepeatAutoreverses:self->_switch];
        } completion:^(BOOL finished) {
        }];
    }
    if (indexPath.row==2) {//左翻页
        [UIView transitionWithView:self.aView duration:self.animation888.duration options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [UIView setAnimationRepeatAutoreverses:self->_switch];
        } completion:^(BOOL finished) {
        }];
    }
    if (indexPath.row==3) {//右翻页
        [UIView transitionWithView:self.aView duration:self.animation888.duration options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [UIView setAnimationRepeatAutoreverses:self->_switch];
        } completion:^(BOOL finished) {
        }];
    }
}
-(void)setAnimation3:(NSIndexPath*)indexPath
{
    [self.animation888 setAutoreverses:self->_switch];
    [self.aView exchangeSubviewAtIndex:0 withSubviewAtIndex:0];
    if (indexPath.row==0) {
        self.animation888.type=@"cube";//立方体
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==1) {
        self.animation888.type=kCATransitionPush;//推出
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==2) {
        self.animation888.type=@"reveal";//揭开
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==3) {
        self.animation888.type=@"moveIn";//覆盖
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==4) {
        self.animation888.type=kCATransitionFade;//淡入淡出
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==5) {
        self.animation888.type=@"suckEffect";//吸收
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==6) {
        self.animation888.type=@"oglFlip";//翻转
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==7) {
        self.animation888.type=@"rippleEffect";//波纹
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==8) {
        self.animation888.type=@"pageCurl";//向上翻页
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==9) {
        self.animation888.type=@"pageUnCurl";//向下翻页
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==10) {
        self.animation888.type=@"cameraIrisHollowOpen";//镜头开
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
    if (indexPath.row==11) {
        self.animation888.type=@"cameraIrisHollowClose";//镜头关
        [self.aView.layer addAnimation:self.animation888 forKey:@"thatGirl"];
    }
}

#pragma mark  返回有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayData.count;
}
#pragma mark  返回每组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    AutoVC *da=[self.arrayData objectAtIndex:section];
    return da.title;
}
#pragma mark  返回每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.arrayData&&self.arrayData.count) {
        AutoVC *da=[self.arrayData objectAtIndex:section];
        return da.concent.count;
    }return 0;
}
#pragma mark  设置每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCell=@"myCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:myCell];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
        cell.backgroundColor=[UIColor cyanColor];
    }
    if (self.arrayData&&indexPath.section<self.arrayData.count) {
        AutoVC *da=[self.arrayData objectAtIndex:indexPath.section];
        NSString *str=[da.concent objectAtIndex:indexPath.row];
        cell.textLabel.text=str;
        cell.textLabel.textColor=[UIColor blueColor];
    }
    return cell;
}


//选择表格视图某一行调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        [self setAnimation1:indexPath];
    }
    if (indexPath.section==1)
    {
        [self setAnimation2:indexPath];
    }
    if (indexPath.section==2)
    {
        [self setAnimation3:indexPath];
    }
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
