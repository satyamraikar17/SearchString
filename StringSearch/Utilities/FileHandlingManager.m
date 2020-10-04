//
//  FileHandlingManager.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//
#import<Cocoa/Cocoa.h>

#import "FileHandlingManager.h"
#import "FileUtil.h"
#import "FileTypeHandler.h"
#import "FileHandleOperation.h"

#define MAX_FILE_COUNT 100
#define MAX_QUEUE_COUNT 2

@implementation FileHandlingManager

- (instancetype)init {
    self.fileHandlerQueue = [[NSOperationQueue  alloc] init];
    [self.fileHandlerQueue setMaxConcurrentOperationCount:MAX_QUEUE_COUNT];
    return self;
}

- (void)findStringOccurrencesInFolderWithSearchString:(NSString *)searchString error:(NSError**)error {
    
    if (0 == [searchString length]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:[NSString stringWithFormat:@"Please enter search string"]];
        [alert addButtonWithTitle:@"OK"];
        [alert runModal];
        return;
    }
    
    NSURL *url = [FileUtil getDirectory];
    
    NSSet *filteredFiles = [FileUtil filteredFiles:url supportedFilesTypes:[FileTypeHandler supportedFileTypes]];
    
    if (MAX_FILE_COUNT < [filteredFiles count]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:[NSString stringWithFormat:@"Too many files to process. Make sure folder has not more than 100 files."]];
        [alert addButtonWithTitle:@"OK"];
        [alert runModal];
        return;
    }
    
    for (NSString *file in filteredFiles)
    {
        FileTypeHandler* fileTypeHandler =  [[FileTypeHandler alloc] initWithFileType:[FileUtil extenstion:file] filePath:file searchString:searchString];
        
        FileHandleOperation *operation = [[FileHandleOperation alloc] initWithFileHandler:fileTypeHandler error:error callBack:^(SearchStringData *result, NSError **error) {
                [self.delegate occurrences:result error:error];
        }
    ];
        [self.fileHandlerQueue addOperation:operation];
    }
}
@end
