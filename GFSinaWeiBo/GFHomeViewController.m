//
//  GFHomeViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/15.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFHomeViewController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"
#import "GFOneViewController.h"

@interface GFHomeViewController ()

@end

@implementation GFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavigationBar {
   
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage: [UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];

}


#pragma 响应事件 - action

-(void)friendsearch {
    
}


-(void)pop {
    
    GFOneViewController *oneViewController = [[GFOneViewController alloc]init];
    oneViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:oneViewController  animated:true];
}

@end
