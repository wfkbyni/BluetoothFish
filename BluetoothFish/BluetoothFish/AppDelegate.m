//
//  AppDelegate.m
//  BluetoothFish
//
//  Created by Mac on 15/11/23.
//  Copyright © 2015年 舒永超. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    UIColor *color = [UIColor colorWithHexString:@"3bbc79"];
    [[UINavigationBar appearance] setBarTintColor:color];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [self commonTabbarController];
    
    [self.window setRootViewController:self.tabbarController];
    
    [self.window makeKeyAndVisible];
    
    [self customizeInterface];

    return YES;
}

- (void)commonTabbarController{
    
    CYLTabBarController *tabbarController = [[CYLTabBarController alloc] init];
    
    NSDictionary *dic1 = @{CYLTabBarItemTitle : @"钓鱼",
                           CYLTabBarItemImage : @"fish_off",
                           CYLTabBarItemSelectedImage : @"fish_on"};
    
    NSDictionary *dic2 = @{CYLTabBarItemTitle : @"购买",
                           CYLTabBarItemImage : @"buy_off",
                           CYLTabBarItemSelectedImage : @"buy_on"};
    
    NSDictionary *dic3 = @{CYLTabBarItemTitle : @"帮助",
                           CYLTabBarItemImage : @"help_off",
                           CYLTabBarItemSelectedImage : @"help_on"};
    
    tabbarController.tabBarItemsAttributes = @[dic1,dic2,dic3];
    
    ViewController *controller1 = [ViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:controller1];
    
    BuyController *controller2 = [BuyController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
    
    HelpController *controller3 = [HelpController new];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
    
    [tabbarController setViewControllers:@[nav1,nav2,nav3]];
    
    self.tabbarController = tabbarController;
}

/**
 *  tabBarItem 的选中和不选中文字属性、背景图片
 */
- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateHighlighted];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
