//
//  GFAccountTool.h
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFSinaAccountInfo.h"

@interface GFAccountTool : NSObject

+(void)saveAcountInfo:(GFSinaAccountInfo *)account;

+(GFSinaAccountInfo *)getAccountInfo;

@end
