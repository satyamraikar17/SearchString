//
//  RtfFileHandler.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import "RtfFileHandler.h"
#import <Foundation/Foundation.h>

@implementation RtfFileHandler

+(NSString *)getExtention {
    return @"rtf";
}

- (id)initWithFilePath:(NSString *)path searchString:(NSString *)searchString {
    self.result = [[SearchStringData alloc] initWithFilePath:path occurrences:@"0" searchString:searchString];
    return self;
}

- (SearchStringData *)occurrence:(NSError**)error {
    self.result.occurrences = [super countSearchString:self.result options:@{NSDocumentTypeDocumentAttribute: NSRTFTextDocumentType} error:error];
    
    return self.result;
}

@end
