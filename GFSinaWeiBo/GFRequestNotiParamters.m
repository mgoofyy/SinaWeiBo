//
//  GFRequestNotiParamters.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/20.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFRequestNotiParamters.h"
#import "GFSinaAccountInfo.h"
#import "GFAccountTool.h"

@implementation GFRequestNotiParamters

-(NSMutableDictionary *)paramters {
    if (_paramters == nil) {
        _paramters = [NSMutableDictionary dictionary];
        NSLog(@"%@",[GFAccountTool getAccountInfo].access_token);
        _paramters[@"access_token"] = [GFAccountTool getAccountInfo].access_token;
    
        _paramters[@"uid"] = [GFAccountTool getAccountInfo].uid;
    }
    return _paramters;
}


@end
