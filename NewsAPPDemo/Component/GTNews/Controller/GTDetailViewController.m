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
@property(nonatomic,strong) UIProgressView *progressView;
@end

@implementation GTDetailViewController
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width,self.view.bounds.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 20)];
        self.progressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.toutiao.com/"]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

#pragma mark -- webView相关delegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
#pragma mark -- KVO相关
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.progressView.progress = self.webView.estimatedProgress;
}
@end
