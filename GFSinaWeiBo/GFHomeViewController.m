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
#import "GFSinaData.h"
#import "MJExtension/MJExtension.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "GFSinaTableViewCell.h"
#import "MJRefresh.h"
#import "GFSinaDataTool.h"

#import "GFRequestNotifiTool.h"

@interface GFHomeViewController ()

@property (nonatomic,strong) NSMutableArray *sinaDataArray;

@end

@implementation GFHomeViewController

#define GFREQUEST_WEIBO_URL @"https://api.weibo.com/2/statuses/friends_timeline.json"

-(NSMutableArray *)sinaDataArray {
    if (_sinaDataArray == nil) {
        _sinaDataArray = [NSMutableArray array];
    }
    
    return _sinaDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self loadSinaData];

    

    [GFRequestNotifiTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

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
    //cell注册
    [self.tableView registerClass:[GFSinaTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadSinaData)];
    [self.tableView.mj_header beginRefreshing];

}

-(void)loadSinaData {
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *requestParameters = [NSMutableDictionary dictionary];
    if (self.sinaDataArray.count != 0) {
        requestParameters[@"since_id"] = [self.sinaDataArray[0] idstr];
    }
    requestParameters[@"access_token"] = [GFAccountTool getAccountInfo].access_token;
    [manger GET:GFREQUEST_WEIBO_URL parameters:requestParameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [GFSinaDataTool getSinaDataModel:responseObject dataModelArray:self.sinaDataArray];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
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

//tableview Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GFSinaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[GFSinaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    GFSinaData *sinaData = (GFSinaData *)self.sinaDataArray[indexPath.row];
    cell.textLabel.text = sinaData.user.name;
    [cell.imageView sd_setImageWithURL:sinaData.user.profile_image_url placeholderImage:[UIImage imageNamed:@"music"]];
    cell.detailTextLabel.text = sinaData.text;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sinaDataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}
@end




