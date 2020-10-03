//
//  MainViewController.m
//  StringSearch
//
//  Created by Satyam Raikar on 02/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "MainViewController.h"
#import "SearchStringResult.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.fileManager = [[FileHandlingManager alloc] init];
    self.fileManager.delegate = self;
}

-(IBAction)actionBrowse:(id)sender {
    
    self.results = [NSMutableArray array];

    NSString *searchString = self.textFieldSearchString.stringValue;

    NSError *error;
    
    [self.fileManager findStringOccurrencesInFolderWithSearchString:searchString error:&error];
}

-(void)occurrences:(SearchStringResult *)result error:(NSError **)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
           if (result) {
               [self.results addObject:result];
           }
           
           [self.tableviewResult reloadData];
    });
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.results count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {

    NSTableCellView* resultView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    id result = [self.results objectAtIndex:row];
    
    resultView.textField.stringValue = [result valueForKeyPath:tableColumn.identifier];
    
    return resultView;
}

@end
