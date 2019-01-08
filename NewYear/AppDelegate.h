//
//  AppDelegate.h
//  NewYear
//
//  Created by 贾倍 on 2019/1/8.
//  Copyright © 2019 贾倍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

