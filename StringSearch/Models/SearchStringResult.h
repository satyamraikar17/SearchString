//
//  SearchStringResult.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#ifndef SearchStringResult_h
#define SearchStringResult_h

@interface SearchStringResult : NSObject

@property(nonatomic, strong) NSString *searchFilePath;
@property(nonatomic, strong) NSString *searchString;
@property(nonatomic, strong) NSString *occurrences;

-(instancetype) initWithFilePath:(NSString *)searchFilePath occurrences:(NSString *) count searchString:(NSString *) searchString;

@end

#endif /* SearchStringResult_h */
