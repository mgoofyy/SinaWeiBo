//
//  GFRequestNotifiTool.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/20.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFRequestNotifiTool.h"
#import "AFNetworking.h"
#import "GFRequestNotiParamters.h"

@implementation GFRequestNotifiTool

+(void)GET:(NSString *)URLString success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSMutableDictionary *requesrParameters = [NSMutableDictionary dictionary];
    requesrParameters = [[GFRequestNotiParamters alloc] init].paramters;
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSLog(@"%@",requesrParameters);
   
    [mgr GET:URLString parameters:requesrParameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
         NSLog(@"_________");
        if (failure) {
            failure(error);
        }
        
    }];
    
}

@end
