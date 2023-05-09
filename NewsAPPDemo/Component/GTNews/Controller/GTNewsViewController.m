//
//  GTNewsViewController.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"

@interface GTNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *arr;
@property (strong,nonatomic) UITableView *tableView;
@end

@implementation GTNewsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];
}

#pragma mark ---TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *newsTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"newsTableViewCell"];
    if (!newsTableViewCell) {
        newsTableViewCell = [[GTNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsTableViewCell"];
        newsTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [newsTableViewCell layoutTableViewCell];
    }

    return newsTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.frame = self.view.frame;
    vc.navigationItem.title = [NSString stringWithFormat:@"这是%@号标题",@(indexPath.row + 1)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark ---TableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 4;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
@end
