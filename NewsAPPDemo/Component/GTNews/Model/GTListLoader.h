//
//  GTListLoader.h
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/11.
//

#import <UIKit/UIKit.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success,NSArray <GTListItem *> *dataArray);
/// 列表网络数据请求
@interface GTListLoader : NSObject
- (void) loadListData:(GTListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
