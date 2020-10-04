//
//  SearchStringResult.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStringData.h"

@implementation SearchStringData

-(instancetype)initWithFilePath:(NSString *)searchFilePath occurrences:(NSString *)count searchString:(NSString *)searchString {
    
    self = [super init];
    
    if(self) {
        self.searchFilePath = searchFilePath;
        self.occurrences = count;
        self.searchString = searchString;
    }
    
    return self;
}

@end
