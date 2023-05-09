//
//  GTRecommendViewController.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

@end

@implementation GTRecommendViewController

- (instancetype) init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
        self.navigationController.navigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height * 5);
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    NSArray *colorArray = @[[UIColor lightGrayColor],[UIColor blueColor],[UIColor redColor],[UIColor greenColor],[UIColor orangeColor]];
    

    for(int i = 0; i < 5;i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
}


@end
