//
//  GTNewsViewController.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import "GTDeleteCellView.h"
#import "GTDetailViewController.h"
#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTListLoader.h"
#import "GTListItem.h"
@interface GTNewsViewController ()<UITableViewDelegate, UITableViewDataSource, GTNormalTableViewCellDelegate>
@property (strong, nonatomic) NSMutableArray *arr;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dateArray;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    GTListLoader *listLoader = [[GTListLoader alloc]init];
    
    __weak typeof (self) weakself = self;
    [listLoader loadListData:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof (weakself) strongself = weakself;
        strongself.dateArray = dataArray;
        [self.tableView reloadData];
        NSLog(@"");
    }];

}

#pragma mark ---TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GTNormalTableViewCell *newsTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"newsTableViewCell"];

    if (!newsTableViewCell) {
        newsTableViewCell = [[GTNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsTableViewCell"];
        newsTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        newsTableViewCell.delegate = self;
        [newsTableViewCell layoutTableViewCellWithItem:[self.dateArray objectAtIndex:indexPath.row]];
    }

    return newsTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//        UIViewController *vc = [[UIViewController alloc]init];
//        vc.view.frame = self.view.frame;
//        vc.navigationItem.title = [NSString stringWithFormat:@"这是%@号标题",@(indexPath.row + 1)];
//        [self.navigationController pushViewController:vc animated:YES];
    GTListItem *item = [self.dateArray objectAtIndex:indexPath.row];
    GTDetailViewController *webView = [[GTDetailViewController alloc]initWithUrlString:item.articleUrl];
    
    webView.title = [NSString stringWithFormat:@"%@", item.title];
    [self.navigationController pushViewController:webView animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark -- TableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 4;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dateArray.count;
}

#pragma mark -- 点击自定义cell的delegate GTNormalTableViewCellDelegate
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
//    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc]initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
//    __weak typeof (self) weakself = self;
//    [deleteView showDeleteViewFromPoint:rect.origin
//                             clickBlock:^{
//        __strong typeof (weakself) strongself = weakself;
////        NSLog(@"蓝色方块被点击");
//        [self.dateArray removeLastObject];
//        [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]]
//                              withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
