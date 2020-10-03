//
//  AppDelegate.h
//  StringSearch
//
//  Created by Satyam Raikar on 02/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>
#import "MainViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong) MainViewController *mainViewController;


@end

