//
//  AutoVC.m
//  UIWork13
//
//  Created by 叶久辉 on 2018/12/1.
//  Copyright © 2018年 ye. All rights reserved.
//

#import "AutoVC.h"

@implementation AutoVC

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithTitle:(NSString*)title content:(NSArray*)content
{
    if (self=[super init]) {
        self.title=title;
        self.concent=content;
    }return self;
}
@end
