//
//  GFAccountTool.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFAccountTool.h"
#import "GFSinaAccountInfo.h"

@implementation GFAccountTool


#define GFAccoutFileName  [NSHomeDirectory() stringByAppendingPathComponent:@"accout.data"]

static GFSinaAccountInfo *_account;
+(void)saveAcountInfo:(GFSinaAccountInfo *)account {
    NSLog(@"%@___________",account);
    [NSKeyedArchiver archiveRootObject:account toFile:GFAccoutFileName];
}

+(GFSinaAccountInfo *)getAccountInfo {
    if (_account == nil) {
         GFSinaAccountInfo *account = [NSKeyedUnarchiver unarchiveObjectWithFile:GFAccoutFileName];
        NSLog(@"%@)",account.access_token);
        _account = account;
    }
   
    return _account;
}

@end
