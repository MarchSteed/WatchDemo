//
//  AppDelegate.m
//  WatchDemo
//
//  Created by LesogoMini on 15/10/29.
//  Copyright © 2015年 重庆美天科技有限公司. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self registerSettingsAndCategories];
    
    return YES;
}

- (void)registerSettingsAndCategories {
    // Create a mutable set to store the category definitions.
    NSMutableSet* categories = [NSMutableSet set];
    
    // Define the actions for a meeting invite notification.
    UIMutableUserNotificationAction* acceptAction = [[UIMutableUserNotificationAction alloc] init];
    acceptAction.title = NSLocalizedString(@"Accept", @"Accept invitation");
    acceptAction.identifier = @"accept";
    acceptAction.activationMode = UIUserNotificationActivationModeBackground;
    acceptAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction* declineAction = [[UIMutableUserNotificationAction alloc] init];
    declineAction.title = NSLocalizedString(@"Decline", @"Decline invitation");
    declineAction.identifier = @"decline";
    declineAction.activationMode = UIUserNotificationActivationModeBackground;
    declineAction.authenticationRequired = NO;
    
    // Create the category object and add it to the set.
    UIMutableUserNotificationCategory* inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
    [inviteCategory setActions:@[acceptAction, declineAction]
                    forContext:UIUserNotificationActionContextDefault];
    inviteCategory.identifier = @"invitation";
    
    [categories addObject:inviteCategory];
    
    // Configure other actions and categories and add them to the set...
    
//    UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:
//                                            (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
//                                                                             categories:categories];
//    
//    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    
    
    //如果已经得到授权，就直接添加本地通知，否则申请询问授权
    if ([[UIApplication sharedApplication]currentUserNotificationSettings].types!=UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }else{
//        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
        
        
        UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:
                                                (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
                                                                                 categories:categories];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
}

-(void)addLocalNotification{
    //定义本地通知对象
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //设置调用时间
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:10];//立即触发
    //设置通知属性
    notification.alertBody=@"HELLO，我是本地通知哦!"; //通知主体
    notification.applicationIconBadgeNumber=1;//应用程序图标右上角显示的消息数
    notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
    notification.soundName=UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
    notification.category = @"invitation";
//    notification.category = @"myCategory";
    
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
//    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    if (notificationSettings.types!=UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
//    NSLog(notification);
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
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];//进入前台取消应用消息图标
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
