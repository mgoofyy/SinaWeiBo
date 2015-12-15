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



@interface GFTabBarViewController ()

@property (nonatomic,strong) NSMutableArray *tabBarItem;

@property (nonatomic,weak) GFHomeViewController *home;

@end

@implementation GFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChildViewController];
    
    
    // Do any additional setup after loading the view.
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
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

//-(void)
@end
