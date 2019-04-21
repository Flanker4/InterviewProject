//
//  AppDelegate.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/20/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "AppDelegate.h"
#import "ShiftModuleConfigurator.h"
#import "ShiftsTableViewController.h"
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController *rootVC  = (UINavigationController*) self.window.rootViewController;
    [ShiftModuleConfigurator configurateModuleWithViewController: (ShiftsTableViewController*)rootVC.topViewController rootVC:rootVC];
    return YES;
}
@end
