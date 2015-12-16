//
//  GFOneViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFOneViewController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"
#import "GFTwoViewController.h"

@implementation GFOneViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
  
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 20, 20)];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
}

-(void)action {
    GFTwoViewController *twoViewController = [[GFTwoViewController alloc]init];
    [self.navigationController pushViewController:twoViewController animated:true];
}

@end
