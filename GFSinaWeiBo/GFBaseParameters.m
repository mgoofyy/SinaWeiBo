//
//  GFBaseParameters.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/20.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFBaseParameters.h"
#import "GFSinaAccountInfo.h"

@implementation GFBaseParameters


-(NSString *)access_token {
    if (_access_token) {
        _access_token = [[GFSinaAccountInfo alloc] access_token];
    }
    return _access_token;
}

@end
