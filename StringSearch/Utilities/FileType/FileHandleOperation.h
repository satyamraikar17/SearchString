//
//  FileHandleOperation.h
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FileTypeHandler.h"

@interface FileHandleOperation : NSOperation
@property (readonly) BOOL isExecuting;
@property (readonly) BOOL isFinished;
@property (nonatomic, strong) FileTypeHandler *fileHandler;
@property (nonatomic, assign) NSError *__autoreleasing*error;

- (void)finish;

- (id)initWithFileHandler:(FileTypeHandler *)fileHandler error:(NSError **)error callBack:(void (^)(SearchStringResult *result, NSError ** error))callBack;

@end
 
