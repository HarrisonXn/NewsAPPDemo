//
//  GTMineViewController.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import "GTMineViewController.h"

@interface GTMineViewController ()

@end

@implementation GTMineViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }
    return self;
}
@end
