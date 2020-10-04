//
//  StringSearchTests.m
//  StringSearchTests
//
//  Created by Satyam Raikar on 02/10/20.
//  Copyright © 2020 Satyam Raikar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileHandleOperation.h"
#import "TextFileHandler.h"
#import "SearchStringData.h"

@interface StringSearchTests : XCTestCase
@property (nonatomic, strong) TextFileHandler *textHandler;
@end

@implementation StringSearchTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"txt"];
    self.textHandler = [[TextFileHandler alloc] initWithFilePath:path searchString:@"test"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testTextFileOccurrences {
    NSError *error;
    SearchStringData *result = [self.textHandler occurrence:&error];
    assert([result.occurrences isEqualTo:@"10"]);
}

- (void)testTextFileOccurrencesFail {
    self.textHandler.data.searchString = @"tester";
    NSError *error;
    SearchStringData *result = [self.textHandler occurrence:&error];
    assert([result.occurrences isEqualTo:@"0"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
