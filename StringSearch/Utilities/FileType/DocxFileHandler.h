//
//  DocxFileHandler.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "FileTypeHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface DocxFileHandler : FileTypeHandler

@property(atomic, strong) SearchStringData *result;

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString;
-(SearchStringData *)occurrence:(NSError**)error;
+(NSString *) getExtention;

@end

NS_ASSUME_NONNULL_END
