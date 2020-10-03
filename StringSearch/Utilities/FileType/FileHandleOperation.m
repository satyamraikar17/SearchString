 //
//  FileHandleOperation.m
//  StringSearch
//
//  Created by Satyam Raikar on 03/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//


#import "FileHandleOperation.h"

@implementation FileHandleOperation {
    typeof  (void (^)(SearchStringResult *, NSError **))callBack1;
    int try;
}

-(id)initWithFileHandler:(FileTypeHandler *)fileHandler error:(NSError **)error callBack:(void (^)(SearchStringResult *result, NSError **))callBack {
    self = [super init];
    if (self) {
        callBack1 = [callBack copy];
        self.fileHandler = fileHandler;
        self.error = error;
     }
    return self;
}

-(BOOL)isConcurrent {
    return YES;
}

-(void)start {
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
     dispatch_async(dispatch_get_main_queue(), ^{
        if (self.isCancelled) {
            [self finish];
            return;
        }
     });
    
    SearchStringResult * result = [self.fileHandler occurrence:self.error];

    callBack1(result, self.error);
    
    [self finish];
}

-(void)finish
{
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    
    _isExecuting = NO;
    _isFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
    
    [self cancel];
}

@end
