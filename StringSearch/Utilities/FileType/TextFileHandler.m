//
//  TextFileHandler.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "TextFileHandler.h"

@implementation TextFileHandler

+(NSString *)getExtention {
    return @"txt";
}

- (id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    self.data = [[SearchStringData alloc] initWithFilePath:path occurrences:@"0" searchString:searchString];
    return self;
}

- (SearchStringData *)occurrence:(NSError**)error  {

    self.data.occurrences = [super countSearchString:self.data options:@{NSDocumentTypeDocumentAttribute: NSPlainTextDocumentType} error:error];
    
    return self.data;
}

@end
