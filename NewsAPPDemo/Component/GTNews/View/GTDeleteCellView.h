//
//  GTDeleteCellView.h
//  NewsAPPDemo
//  点击删除cell按钮的弹窗视图
//  Created by 邢世航 on 2023/5/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
