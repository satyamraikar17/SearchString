//
//  TextFileHandler.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileTypeHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextFileHandler : FileTypeHandler

@property(atomic, strong) SearchStringResult *result;

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString;
-(SearchStringResult *)occurrence:(NSError**)error;
+(NSString *) getExtention;

@end

NS_ASSUME_NONNULL_END
