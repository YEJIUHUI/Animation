//
//  ViewController.h
//  UIWork13
//
//  Created by 叶久辉 on 2018/12/1.
//  Copyright © 2018年 ye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
   BOOL _switch;
}
@property(nonatomic,retain)UITableView *aTableView;
@property(nonatomic,retain)NSMutableArray *arrayData;

@property(nonatomic,retain)UIView *aView;
@property(nonatomic,retain)UILabel *lab;

@property(nonatomic)CGFloat time1;

@property(nonatomic,retain)CATransition *animation888;
@end

