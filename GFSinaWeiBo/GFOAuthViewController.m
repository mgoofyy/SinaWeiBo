//
//  GFOAuthViewController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFOAuthViewController.h"
#import "AFNetworking.h"

@interface GFOAuthViewController() <UIWebViewDelegate>

@end


@implementation GFOAuthViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSString *BASEURL = @"https://api.weibo.com/oauth2/authorize";
    NSString *APPSECRET = @"957577993";
    NSString *REDIRCT_URI = @"http://www.goofyy.com";
    
    //合并字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",BASEURL,APPSECRET,REDIRCT_URI];
    
    NSLog(@"%@",urlStr);
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@",request);
    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        NSLog(@"%@",code);
    }
    return YES;
}

@end
