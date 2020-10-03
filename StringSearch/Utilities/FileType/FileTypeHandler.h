//
//  FileTypeHandler.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStringResult.h"
#import <AppKit/NSAttributedString.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileTypeHandleProtocol
@required
    -(SearchStringResult *)occurrence:(NSError**)error;
    -(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString;
@end

@interface FileTypeHandler : NSObject <FileTypeHandleProtocol>

+(NSArray *)supportedFileTypes;

-(id)initWithFileType:(NSString *)fileType filePath:(NSString *)filePath searchString:(NSString *) searchString;

-(NSString *)countSearchString:(SearchStringResult *)dataHolder options:(NSDictionary *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
