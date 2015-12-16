//
//  GFSinaAccountInfo.h
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSinaAccountInfo : UIViewController

//"access_token" = "2.00Avt4LE2mtnCBeddd6f470b0RKAQa";
//"expires_in" = 157679999;
//"remind_in" = 157679999;
//uid = 3832767522;

@property (nonatomic,copy) NSString *access_token;

@property (nonatomic,copy) NSString *expires_in;

@property (nonatomic,copy) NSString *remind_in;

@property (nonatomic,copy) NSString *uid;

+(instancetype)accoutWithDict:(NSDictionary *)dict;
+(instancetype)initWithDict:(NSDictionary *)dict;
@end
