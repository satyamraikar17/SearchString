//
//  DocFileHandler.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "DocFileHandler.h"
#import <Foundation/Foundation.h>

@implementation DocFileHandler

+(NSString *)getExtention {
    return @"doc";
}

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    self.result = [[SearchStringData alloc] initWithFilePath:path occurrences:@"0" searchString:searchString];
    return self;
}

-(SearchStringData *)occurrence:(NSError**)error {
    self.result.occurrences = [super countSearchString:self.result options:@{NSDocumentTypeDocumentAttribute: NSWebArchiveTextDocumentType} error:error];
    
    return self.result;
}



@end
