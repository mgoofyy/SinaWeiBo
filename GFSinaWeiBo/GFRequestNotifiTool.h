//
//  GFRequestNotifiTool.h
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/20.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GFRequestNotifiTool : NSObject

+(void)GET:(NSString *)URLString success:(void (^)( id responseObject))success
    failure:(void (^)( NSError *error))failure;

@end
