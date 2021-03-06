//
//  GFHomeTabBarViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/15.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFTabBarViewController.h"
#import "GFHomeViewController.h"
#import "UIImage+GFImage.h"
#import "GFMessageViewController.h"
#import "GFDiscoverViewController.h"
#import "GFMeViewController.h"
#import "GFTabBar.h"
#import "GFNavigationController.h"
#import "GFRequestNotifiTool.h"
#import "GFNotificationNumber.h"
#import "MJExtension/MJExtension.h"

@interface GFTabBarViewController ()

@property (nonatomic,strong) NSMutableArray *tabBarItem;

@property (nonatomic,weak) GFHomeViewController *home;

@end

@implementation GFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChildViewController];
    
//    NSLog(@"%@",self.tabBar.subviews);
    
    GFTabBar *tabBar = [[GFTabBar alloc]initWithFrame:self.tabBar.frame];
//    self.tabBar = tabBar;
    [self setValue:tabBar forKey:@"tabBar"];
//    NSLog(@"%@",self.tabBar);
//    [self.tabBar removeFromSuperview];
    // Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(requestNotificationNumber) userInfo:nil repeats:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setChildViewController {
    //首页
    GFHomeViewController *home = [[GFHomeViewController alloc]init];
    _home = home;
    [self setTabBarItem:home image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"首页"];
    
    GFMessageViewController *messageViewController = [[GFMessageViewController alloc]init];
    [self setTabBarItem:messageViewController image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_highlighted" title:@"消息"];
    
    GFDiscoverViewController *discoverViewController = [[GFDiscoverViewController alloc]init];
    [self setTabBarItem:discoverViewController image:@"tabbar_discover" selectedImage:@"tabbar_discover_highlighted" title:@"发现"];
    
    GFMeViewController *meViewController = [[GFMeViewController alloc]init];
    [self setTabBarItem:meViewController image:@"tabbar_profile" selectedImage:@"tabbar_profile_highlighted" title:@"我"];
    
}


-(void)setTabBarItem:(UIViewController *)viewController image:(NSString *)imageName selectedImage:(NSString *)selectImageName title:(NSString *)title {
   
    viewController.tabBarItem.image = [UIImage imageWithOriginImage:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithOriginImage:selectImageName];
    viewController.title = title;
    GFNavigationController *nav = [[GFNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
    [self.tabBarItem addObject:viewController];
}

-(void)requestNotificationNumber {
    [GFRequestNotifiTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" success:^(id responseObject){
        
        GFNotificationNumber *noficationData = [GFNotificationNumber mj_objectWithKeyValues:responseObject];
        _home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",noficationData.status];
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:99];
        
    } failure:^(NSError *error) {
        
    }];
}
@end
