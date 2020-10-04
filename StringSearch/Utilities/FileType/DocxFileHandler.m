//
//  DocxFileHandler.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "DocxFileHandler.h"
#import <Foundation/Foundation.h>

@implementation DocxFileHandler

+(NSString *)getExtention {
    return @"docx";
}

-(id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    self.result = [[SearchStringData alloc] initWithFilePath:path occurrences:@"0" searchString:searchString];
    return self;
}

-(SearchStringData *)occurrence:(NSError**)error {
    self.result.occurrences = [super countSearchString:self.result options:@{NSDocumentTypeDocumentAttribute: NSOfficeOpenXMLTextDocumentType} error:error];
    
    return self.result;
}



@end
