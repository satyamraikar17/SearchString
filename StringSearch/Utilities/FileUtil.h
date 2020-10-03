//
//  FileUtil.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileUtil : NSObject

+(NSURL *)getDirectory;

+(NSSet *)filteredFiles:(NSURL *)folder supportedFilesTypes:(NSArray *)types;

+(NSString *)predicateStringForSupportedTypes:(NSArray *)types;

+(NSString *)extenstion:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
