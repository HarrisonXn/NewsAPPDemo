//
//  AppDelegate.m
//  NewsAPPDemo
//
//  Created by 邢世航 on 2023/5/9.
//

#import "AppDelegate.h"
#import "GTMineViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTNewsViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    //创建UITabBar
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    
    GTMineViewController *gtMineVC = [[GTMineViewController alloc]init];
    GTNewsViewController *gtNewsVC = [[GTNewsViewController alloc]init];
    GTVideoViewController *gtVideoVC = [[GTVideoViewController alloc]init];
    GTRecommendViewController *gtRecommendVC = [[GTRecommendViewController alloc]init];
    
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:tabBarVC];
    navVC.navigationBar.barStyle = UIBarStyleDefault;
    [tabBarVC setViewControllers:@[gtNewsVC,gtVideoVC,gtRecommendVC,gtMineVC]];

    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"NewsAPPDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
