//
//  AppDelegate.m
//  NongYunTong
//
//  Created by YoungShook on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "CultureViewController.h"
#import "TrafficViewController.h"
#import "WeatherViewController.h"
#import "LifeViewController.h"
#import "HomeViewController.h"
#import "TopCultureViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate = self;
   
    
    HomeViewController *homeViewController = [[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil]autorelease];
        //首页
    
    TopCultureViewController *topCultureViewController = [[[TopCultureViewController alloc]init]autorelease];
        //南阳文化
    
    
    TrafficViewController *trafficViewController = [[[TrafficViewController alloc]initWithNibName:@"TrafficViewController" bundle:nil]autorelease];
        //比赛交通
    
    WeatherViewController *weatherViewController = [[[WeatherViewController alloc]initWithNibName:@"WeatherViewController" bundle:nil]autorelease];
        //比赛天气
   
    LifeViewController *lifeViewController = [[[LifeViewController alloc]init]autorelease];
        //南阳生活向导
    
    UINavigationController *navHomeViewController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
        navHomeViewController.title = @"农运首页";
    UINavigationController *cultureNavigationController = [[UINavigationController alloc]initWithRootViewController:topCultureViewController];
    cultureNavigationController.title = @"南阳文化";
    UINavigationController *navTrafficViewController = [[UINavigationController alloc]initWithRootViewController:trafficViewController];
        navTrafficViewController.title = @"交通服务";
    UINavigationController *navLifeViewController = [[UINavigationController alloc]initWithRootViewController:lifeViewController];
        navLifeViewController.title = @"便利向导";
   
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navHomeViewController,cultureNavigationController,navTrafficViewController,navLifeViewController,weatherViewController, nil];
    
    [cultureNavigationController release];
    [navHomeViewController release];
    [navLifeViewController release];
    [navTrafficViewController release];
        // [navWeatherViewController release];

    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
