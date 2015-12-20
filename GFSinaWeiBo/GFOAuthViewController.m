//
//  GFOAuthViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFOAuthViewController.h"
#import "AFNetworking.h"
#import "GFSinaAccountInfo.h"
#import "GFAccountTool.h"

@interface GFOAuthViewController() <UIWebViewDelegate>

@end


@implementation GFOAuthViewController

#define GFBASEURL         @"https://api.weibo.com/oauth2/authorize"
#define GFAPP_KEY         @"957577993"
#define GFREDIRCT_URI     @"http://www.goofyy.com"

#define GFACCESS_BASEURL  @"https://api.weibo.com/oauth2/access_token"
#define GFAPP_SECRET      @"9335fbef35fd0f3fc9dc9eabaab6ba5f"


#define GFAccoutFileName  [NSHomeDirectory() stringByAppendingPathComponent:@"accout.data"]



-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    
    
    //合并字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",GFBASEURL,GFAPP_KEY,GFREDIRCT_URI];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
   
    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        NSLog(@"————————————————%@",code);
        [self requestUserAccessToken:code];
        
    }
    return YES;
}

//获取access_token
//client_id	true	string	申请应用时分配的AppKey。
//client_secret	true	string	申请应用时分配的AppSecret。
//grant_type	true	string	请求的类型，填写authorization_code
//code	true	string	调用authorize获得的code值。
//redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。

-(void)requestUserAccessToken:(NSString *)code {
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *requestParams = [NSMutableDictionary dictionary];
    requestParams[@"client_id"] = GFAPP_KEY;
    requestParams[@"client_secret"] = GFAPP_SECRET;
    requestParams[@"grant_type"] = @"authorization_code";
    requestParams[@"code"] = code;
    requestParams[@"redirect_uri"] = GFREDIRCT_URI;
    
    [manger POST:GFACCESS_BASEURL parameters:requestParams success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"+++++++%@",responseObject);
        GFSinaAccountInfo *userInfoDiction = [GFSinaAccountInfo initWithDict:responseObject];
       
        //把数据归档
        [GFAccountTool saveAcountInfo:userInfoDiction];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"___________________%@",error);
    }];
    
}

@end
