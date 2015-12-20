//
//  GFSinaData.h
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/17.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFUser.h"
#import "MJExtension/MJExtension.h"
#import "GFPhoto.h"

@interface GFSinaData : NSObject <MJKeyValue>

/*
 created_at	string	微博创建时间
 text	string	微博信息内容
 source	string	微博来源
 favorited	boolean	是否已收藏，true：是，false：否
 thumbnail_pic	string	缩略图片地址，没有时不返回此字段
 bmiddle_pic	string	中等尺寸图片地址，没有时不返回此字段
 original_pic	string	原始图片地址，没有时不返回此字段
 geo	object	地理信息字段 详细
 user	object	微博作者的用户信息字段 详细
 retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 reposts_count	int	转发数
 comments_count	int	评论数
 attitudes_count	int	表态数

 pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。

 */



@property (nonatomic,strong) GFSinaData *states;

@property (nonatomic,copy) NSString *created_at;

@property (nonatomic,copy) NSString *text;

@property (nonatomic,copy) NSString *favorited;

@property (nonatomic,strong) NSURL *thumbnail_pic;

@property (nonatomic,copy) NSString *idstr;

@property (nonatomic,copy) NSString *source;

@property (nonatomic,assign) int reposts_count;

@property (nonatomic,assign) int comments_count;

@property (nonatomic,assign)int attitudes_count;

@property (nonatomic,strong) GFUser *user;

@property (nonatomic,strong) NSArray *pic_urls;

//@property (nonatomic,strong) GFUser *




@end
