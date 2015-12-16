//
//  GFDiscoverViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/15.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFDiscoverViewController.h"
#import "UIImage+GFImage.h"
#import "GFSearchBar.h"

@interface GFDiscoverViewController ()

@end

@implementation GFDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GFSearchBar *searchBar = [[GFSearchBar alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 35)];
    self.navigationItem.titleView = searchBar;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
