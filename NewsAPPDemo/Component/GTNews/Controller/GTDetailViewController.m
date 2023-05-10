//
//  GTDetailViewController.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/10.
//
#import <WebKit/WebKit.h>
#import "GTDetailViewController.h"

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
@end

@implementation GTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width,self.view.bounds.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.toutiao.com/"]]];
}

#pragma mark -- webView相关delegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
@end
