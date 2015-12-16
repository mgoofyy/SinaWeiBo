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
#import "AFNetworking.h"
#import "GFAccountTool.h"

@interface GFHomeViewController ()

@end

@implementation GFHomeViewController

#define GFREQUEST_WEIBO_URL @"https://api.weibo.com/2/statuses/public_timeline.json"

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self loadSinaData];
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

-(void)loadSinaData {
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *requestParameters = [NSMutableDictionary dictionary];
    requestParameters[@"access_token"] = [GFAccountTool getAccountInfo].access_token;
    [manger GET:GFREQUEST_WEIBO_URL parameters:requestParameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
       
    }];
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
