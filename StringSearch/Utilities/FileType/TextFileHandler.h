//
//  TextFileHandler.h
//  Used to count the occurrence of search string in plain text files
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileTypeHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextFileHandler : FileTypeHandler

@property(atomic, strong) SearchStringData *data;

- (id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString;

/*!
   @brief Used to count the occurrence of search string in plain text files

   @return SearchStringResult  result containing occurrence of search string count
*/
- (SearchStringData *)occurrence:(NSError**)error;

/*!
   @brief Used to get extension of a text file
 
   @return NSString  extension of text file ex: @"txt"
*/
+(NSString *) getExtention;

@end

NS_ASSUME_NONNULL_END
