//
//  MainViewController.h
//  StringSearch
//
//  Created by Satyam Raikar on 02/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FileHandlingManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : NSViewController<NSTableViewDataSource, NSTableViewDelegate, FileHandlingManagerDelegate>

@property (nonatomic,weak) IBOutlet NSButton *buttonBrowse;

- (IBAction)actionBrowse:(id)sender;

@property (nonatomic,weak) IBOutlet NSTextField *textFieldSearchString;

@property (nonatomic,weak) IBOutlet NSTableView *tableviewResult;

@property(nonatomic, strong) NSMutableArray *results;

@property(nonatomic, strong) FileHandlingManager *fileManager;

@end

NS_ASSUME_NONNULL_END
