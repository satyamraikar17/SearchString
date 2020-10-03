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

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    self.result = [[SearchStringResult alloc] initWithFilePath:path occurrences:@"0" searchString:searchString];
    return self;
}

-(SearchStringResult *)occurrence:(NSError**)error  {

    self.result.occurrences = [super countSearchString:self.result options:@{NSDocumentTypeDocumentAttribute: NSPlainTextDocumentType} error:error];
    
    return self.result;
}

@end
