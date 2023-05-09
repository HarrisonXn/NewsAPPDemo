//
//  AppDelegate.h
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,strong) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

