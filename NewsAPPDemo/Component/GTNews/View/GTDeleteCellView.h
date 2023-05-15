//
//  GTDeleteCellView.h
//  NewsAPPDemo
//  点击删除cell按钮的弹窗视图
//  Created by 邢世航 on 2023/5/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 点击删除cell的弹窗视图
@interface GTDeleteCellView : UIView

/// 展示弹窗视图
/// - Parameters:
///   - point: 从传入的point参数开始弹出
///   - clickBlock: 点击确认删除弹框后执行的代码操作block
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
