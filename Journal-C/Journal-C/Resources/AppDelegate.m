//
//  AppDelegate.m
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "AppDelegate.h"
#import "EntryController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[EntryController sharedInstance] loadFromPersistentStore];
    
    return YES;
}

@end
