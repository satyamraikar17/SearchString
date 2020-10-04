//
//  FileHandlingManager.h
//  Used to calculate occurrence of search string in files.
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStringData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FileHandlingManagerDelegate <NSObject>

-(void)occurrences:(SearchStringData *)result error:(NSError **)error;

@end

@interface FileHandlingManager : NSObject

@property(nonatomic, weak) id<FileHandlingManagerDelegate> delegate;
@property (nonatomic, strong) NSOperationQueue *fileHandlerQueue;

/*!
   @brief Used to calculate occurrence of search string in files.

   @discussion Calling this method will open a window allowing user to select a folder containing files. Search string provided as input will be searched in all supported files present in the folder and occurrences will be calculated for each file. Result will be made available to client implementating FileHandlingManagerDelegate protocol
     
   @param searchString NSString to search in files
 
   @param error NSError reference to error pointer
*/
-(void)findStringOccurrencesInFolderWithSearchString:(NSString *)searchString error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
