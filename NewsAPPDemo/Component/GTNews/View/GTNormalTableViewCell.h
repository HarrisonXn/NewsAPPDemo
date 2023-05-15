//
//  GTNormalTableViewCell.h
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;
@protocol GTNormalTableViewCellDelegate <NSObject>

/// 点击删除按钮
/// - Parameters:
///   - tableViewCell: <#tableViewCell description#>
///   - deleteButton: <#deleteButton description#>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

/// 新闻列表Cell
@interface GTNormalTableViewCell : UITableViewCell
- (void)layoutTableViewCellWithItem:(GTListItem *)item;

@property (weak, nonatomic) id <GTNormalTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
