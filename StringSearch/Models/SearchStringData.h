//
//  SearchStringData.h
//  Data holder class to containing the occurrence count and other info provided by FileHandler type classes
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#ifndef SearchStringResult_h
#define SearchStringResult_h

@interface SearchStringData : NSObject
/*!
   @brief File to search
*/
@property(nonatomic, strong) NSString *searchFilePath;

/*!
   @brief Search string used for searching the file
*/
@property(nonatomic, strong) NSString *searchString;

/*!
   @brief Occurrence count of search string in file in NSString format
*/
@property(nonatomic, strong) NSString *occurrences;

-(instancetype) initWithFilePath:(NSString *)searchFilePath occurrences:(NSString *) count searchString:(NSString *) searchString;

@end

#endif /* SearchStringResult_h */
