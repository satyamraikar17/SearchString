//
//  FileUtil.h
//  Provides utility methods to accessing and filetering files in the system.
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileUtil : NSObject

/*!
    @brief Used to get folder path in NSUrl Format.
 
    @discussion Opens a window allowing user to select the folder present in the system. Make sure to call this on Main Thread.
 
    @return NSUrl Path of the folder containing files selected by user.
 */
+(NSURL *)getDirectory;


/*!
   @brief Used to the files present in the given folder path.

   @discussion Given a folder path and supported file types (extension), this method will return paths of files contained in the folder applying the filter
     
   @param folder folder path in NSUrl format
 
   @param types NSArray containing file extenstion in NSString format ex: [@"txt", @"doc"]

   @return NSSet containing paths of filtered files in NSString format
*/
+(NSSet *)filteredFiles:(NSURL *)folder supportedFilesTypes:(NSArray *)types;


/*!
   @brief Used to get extension of a file

   @discussion Given a file path this method will return extension of that file
 
   @param path file path in NSString format

   @return NSString  extension of file
*/
+(NSString *)extenstion:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
