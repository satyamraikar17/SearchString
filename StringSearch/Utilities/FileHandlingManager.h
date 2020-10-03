//
//  FileHandlingManager.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStringResult.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FileHandlingManagerDelegate <NSObject>

-(void)occurrences:(SearchStringResult *)result error:(NSError **)error;

@end

@interface FileHandlingManager : NSObject

@property(nonatomic, weak) id<FileHandlingManagerDelegate> delegate;
@property (nonatomic, strong) NSOperationQueue *fileHandlerQueue;

-(void)findStringOccurrencesInFolderWithSearchString:(NSString *)searchString error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
