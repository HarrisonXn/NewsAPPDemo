//
//  GTNormalTableViewCell.h
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell
-(void)layoutTableViewCell;

@property (weak,nonatomic) id <GTNormalTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
