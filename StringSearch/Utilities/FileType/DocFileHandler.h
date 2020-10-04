//
//  DocFileHandler.h
//  StringSearch
//  Used to count the occurrence of search string in webarchived doc files
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "FileTypeHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface DocFileHandler : FileTypeHandler

@property(atomic, strong) SearchStringData *result;

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString;

/*!
   @brief Used to count the occurrence of search string in webarchived doc files

   @return SearchStringResult  result containing occurrence of search string count
*/
-(SearchStringData *)occurrence:(NSError**)error;

/*!
   @brief Used to get extension of a doc file
 
   @return NSString  extension of doc file ex: @"doc"
*/
+(NSString *) getExtention;

@end

NS_ASSUME_NONNULL_END
