//
//  GFSinaDataTool.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/20.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFSinaDataTool.h"
#import "MJExtension.h"
#import "GFSinaData.h"

@implementation GFSinaDataTool


+(void)getSinaDataModel:(id _Nonnull)responseObject dataModelArray:(NSMutableArray  * _Nonnull )array{
    NSArray *dictArr = (NSArray *)responseObject[@"statuses"];
    NSArray *sinaStatuses = (NSMutableArray *)[GFSinaData mj_objectArrayWithKeyValuesArray:dictArr];
    //        for (NSDictionary *dict in dictArr) {
    //            GFSinaData *sinaDataOfOne = [GFSinaData mj_objectWithKeyValues:dict];
    //            [self.sinaDataArray addObject:sinaDataOfOne];
    //        }
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, dictArr.count)];
    [array insertObjects:sinaStatuses atIndexes:indexSet];
    
    

}

@end
