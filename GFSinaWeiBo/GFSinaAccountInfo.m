//
//  GFSinaAccountInfo.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFSinaAccountInfo.h"

@interface GFSinaAccountInfo() <NSCoding>

@end

@implementation GFSinaAccountInfo

//解档归档键值
#define GFaccess_tokenKEY @"access_token"
#define GFexpires_inKEY   @"expires_in"
#define GFuidKEY          @"uid"

+(instancetype)accoutWithDict:(NSDictionary *)dict {
    GFSinaAccountInfo *accoutInfo = [[self alloc] init];
    [accoutInfo setValuesForKeysWithDictionary:dict];
       return accoutInfo;
  
}


+(id)initWithDict:(NSDictionary *)dict {
   
    return [self accoutWithDict:dict];
}

//解档

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:GFaccess_tokenKEY];
        _expires_in   = [aDecoder decodeObjectForKey:GFexpires_inKEY];
//        _remind_in    = [aDecoder decodeObjectForKey:@"remind_in"];
        _uid          = [aDecoder decodeObjectForKey:GFuidKEY];
    }
    return self;
}
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_access_token forKey:GFaccess_tokenKEY];
    [aCoder encodeObject:_expires_in forKey:GFexpires_inKEY];
    [aCoder encodeObject:_uid forKey:GFuidKEY];
//    [aCoder encodeObject:_remind_in forKey:@"remind_in"];
}

@end
