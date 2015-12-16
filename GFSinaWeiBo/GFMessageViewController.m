//
//  GFMessageViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/15.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFMessageViewController.h"

@interface GFMessageViewController ()

@end

@implementation GFMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"发起聊天" style:UIBarButtonItemStylePlain target:self action:@selector(launchChat)];
    self.navigationItem.leftBarButtonItem = leftButton;
//    self.navigationItem
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
