//
//  AutoVC.h
//  UIWork13
//
//  Created by 叶久辉 on 2018/12/1.
//  Copyright © 2018年 ye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoVC : UIView
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSArray  *concent;

-(id)initWithTitle:(NSString*)title content:(NSArray*)content ;
@end
