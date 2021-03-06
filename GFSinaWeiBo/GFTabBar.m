//
//  GFTabBar.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFTabBar.h"

@interface GFTabBar()

@property (nonatomic,strong) NSMutableArray *buttons;

@end



@implementation GFTabBar

//
//-(NSMutableArray *)buttons {
//    if (_buttons == nil) {
//        NSMutableArray *buttons = [[NSMutableArray alloc]init];
//        _buttons = buttons;
//        [self getButtons];
//        
//    }
//    return _buttons;
//}
//
//
//-(void)getButtons {
//    for (UIBarButtonItem *item in self.items) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.tag = self.buttons.count;
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
//        if (btn.tag == 0) { // 选中第0个
//            [self btnClick:btn];
//            
//        }
//        
//        [self addSubview:btn];
//        
//        // 把按钮添加到按钮数组
//        [self.buttons addObject:btn];
//    }
//}
//
//
//-(void)btnClick:(UIButton *)button {
//    NSLog(@"hello");
//}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];

    self.tintColor = [UIColor orangeColor];
    CGFloat tabBarX = 0;
    CGFloat tabBarY = 0;
    CGFloat tabBarW = self.bounds.size.width / (self.items.count + 1);
    CGFloat tabBarH = self.bounds.size.height;
    
    int i = 0;
    for (UIView *tabBarView in self.subviews) {
        
        if ([tabBarView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            tabBarView.frame = CGRectMake(tabBarW * i, tabBarY, tabBarW, tabBarH);
            if (i == 1) {
                i++;
                [self addMessagePlus];
            }
            i++;
        }
        
       
    }
}

-(void)addMessagePlus {
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateHighlighted];
    plusButton.frame = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
     plusButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [plusButton sizeToFit];
    [self addSubview:plusButton];
    
}


@end
