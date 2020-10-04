//
//  FileTypeHandler.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "FileTypeHandler.h"
#import "TextFileHandler.h"
#import "RtfFileHandler.h"
#import "DocxFileHandler.h"
#import "DocFileHandler.h"

@implementation FileTypeHandler

+(NSArray *)supportedFileTypes {
    return [NSArray arrayWithObjects:
            //register text
            [TextFileHandler getExtention],
            //register rtf
            [RtfFileHandler getExtention],
            //register docx
            [DocxFileHandler getExtention],
            //register doc
            [DocFileHandler getExtention],
            
            nil];
}

- (id)initWithFileType:(NSString *)fileType filePath:(NSString *)filePath searchString:(NSString *) searchString {
    self = nil;
    if ([fileType isEqualToString:[TextFileHandler getExtention]]){
        self = [[TextFileHandler alloc] initWithFilePath:filePath searchString:searchString];
    }
    else if ([fileType isEqualToString:[RtfFileHandler getExtention]]) {
        self = [[RtfFileHandler alloc] initWithFilePath:filePath searchString:searchString];
    }
    else if ([fileType isEqualToString:[DocxFileHandler getExtention]]) {
        self = [[DocxFileHandler alloc] initWithFilePath:filePath searchString:searchString];
    }
    
    else if ([fileType isEqualToString:[DocFileHandler getExtention]]) {
        self = [[DocFileHandler alloc] initWithFilePath:filePath searchString:searchString];
    }

    return self;
}

- (SearchStringData *)occurrence:(NSError**)error {
    [NSException raise:NSInternalInconsistencyException
                format:@"You have not implemented %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    [NSException raise:NSInternalInconsistencyException
                format:@"You have not implemented %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (NSString *)countSearchString:(SearchStringData *)dataHolder options:(NSDictionary *)options error:(NSError **)error {
     NSData *data = [NSData dataWithContentsOfFile:dataHolder.searchFilePath];

        NSAttributedString *attributedContent = [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:error];
        
        NSString *content = attributedContent.string;

    NSInteger occurence =  [content length] - [[content stringByReplacingOccurrencesOfString:dataHolder.searchString withString:@""] length];
    occurence /= [dataHolder.searchString length];
    
    return [@(occurence) stringValue];
}

@end

