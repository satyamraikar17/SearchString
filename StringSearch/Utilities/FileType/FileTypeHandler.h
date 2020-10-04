//
//  FileTypeHandler.h
//  Factory Base class for File handlers
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

/*!
   @brief Used to get supported file extensions
 
   @return NSArray  extensions in NSString format ex: [@"txt", @"doc"]
*/
+(NSArray *)supportedFileTypes;

/*!
   @brief Decides the class that will be handling the occurrence calculations based on file type
 */
-(id)initWithFileType:(NSString *)fileType filePath:(NSString *)filePath searchString:(NSString *) searchString;

/*!
   @brief Used to parse file and calculate occurrences of search string
 
   @param dataHolder container object containing filepath to search and search string
   
   @param options NSAttributed string data decoding options

   @return Nsstring string occurence count in sring format
*/
-(NSString *)countSearchString:(SearchStringResult *)dataHolder options:(NSDictionary *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
