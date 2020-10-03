//
//  FileUtil.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "FileUtil.h"
#import <Cocoa/Cocoa.h>

@implementation FileUtil

+(NSURL *)getDirectory {
   NSOpenPanel *panel = [NSOpenPanel openPanel];
   [panel setAllowsMultipleSelection:NO];
   [panel setCanChooseDirectories:YES];
   [panel setCanChooseFiles:NO];
   if ([panel runModal] != NSModalResponseOK) return nil;
   return [[panel URLs] lastObject];
}

+(NSSet *)filteredFiles:(NSURL *)folder supportedFilesTypes:(NSArray *)types {
    NSError *error = nil;
    NSArray *dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:folder includingPropertiesForKeys:false options:NSDirectoryEnumerationSkipsSubdirectoryDescendants error:&error];
    
    NSString *predicateString = [FileUtil predicateStringForSupportedTypes:types];
    
    NSSet *filteredFiles = [NSSet setWithArray:[[dirs filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateString]] valueForKeyPath:@"self.relativePath"]];
    
    return filteredFiles;
}

+(NSString *)predicateStringForSupportedTypes:(NSArray *)types {
    
    NSMutableArray *predicates = [NSMutableArray array];
    
    for (id type in types) {
        [predicates addObject:[NSString stringWithFormat:@"(self.relativePath ENDSWITH '%@')", type]];
    }
    
    NSString *predicateString = [predicates componentsJoinedByString:@"or"];
    return predicateString;
}

+(NSString *)extenstion:(NSString *)path {
    return [path pathExtension];
}

@end
