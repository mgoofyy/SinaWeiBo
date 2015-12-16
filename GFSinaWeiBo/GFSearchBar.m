//
//  GFSearchBar.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFSearchBar.h"
#import "UIImage+GFImage.h"

@implementation GFSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UITextField *searchBarTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 35)];
        self.placeholder = @"大家都在搜索 毒奶粉";
        self.font = [UIFont systemFontOfSize:13];
        self.alpha = 0.8;
        [self setBackground:[UIImage imageWithStretchableName:@"searchbar_textfield_background"]];
        
        UIImageView *searchIconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        searchIconImage.frame = CGRectMake(0, 0, 30, 25);
        searchIconImage.contentMode = UIViewContentModeCenter;
        self.leftView = searchIconImage;
        
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
