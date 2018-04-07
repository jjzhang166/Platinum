//
//  AppDelegate.m
//  MobileMediaController
//
//  Created by joker on 2016/12/1.
//
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
-(void)applicationDidFinishLaunching:(UIApplication *)application {
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
}
@end
