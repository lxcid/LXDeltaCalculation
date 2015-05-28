//
//  LXDeltaCalculationTests.m
//  LXDeltaCalculationTests
//
//  Created by Stan Chang Khin Boon on 3/3/15.
//  Copyright (c) 2015 lxcid. All rights reserved.
//

@import UIKit;
@import XCTest;

@import LXDeltaCalculation;

@interface LXDeltaCalculationTests : XCTestCase

@end

@implementation LXDeltaCalculationTests

- (void)testEmptyOrNilArrays {
    NSArray *oldArray = @[ @1, @3, @5 ];
    NSArray *newArray = @[ @0, @1, @2, @3, @4, @5, @6 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:nil toNewArray:newArray];
        XCTAssert(delta.addedIndices.count == 7, @"7 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:@[] toNewArray:newArray];
        XCTAssert(delta.addedIndices.count == 7, @"7 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:nil];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 3, @"3 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:@[]];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 3, @"3 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:nil toNewArray:nil];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:@[] toNewArray:@[]];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:@[] toNewArray:nil];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
    
    {
        LXDelta *delta = [defaultCalculator deltaFromOldArray:nil toNewArray:@[]];
        XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
        XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
        XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
        XCTAssert(delta.unchangedIndexPairs.count == 0, @"0 items unchanged.");
    }
}

- (void)testInsertion {
    NSArray *oldArray = @[ @1, @3, @5 ];
    NSArray *newArray = @[ @0, @1, @2, @3, @4, @5, @6 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 4, @"4 items added.");
    XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
    XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 3, @"3 items unchanged.");
    
    NSMutableIndexSet *addedIndices = [[NSMutableIndexSet alloc] init];
    [addedIndices addIndex:0];
    [addedIndices addIndex:2];
    [addedIndices addIndex:4];
    [addedIndices addIndex:6];
    XCTAssert([delta.addedIndices isEqual:addedIndices], @"equal.");
    NSMutableArray *unchangedIndexPairs = [[NSMutableArray alloc] init];
    [unchangedIndexPairs addObject:@[ @0, @1 ]];
    [unchangedIndexPairs addObject:@[ @1, @3 ]];
    [unchangedIndexPairs addObject:@[ @2, @5 ]];
    XCTAssert([delta.unchangedIndexPairs isEqual:unchangedIndexPairs], @"equal.");
}

- (void)testInsertionDuplicate {
    NSArray *oldArray = @[ @1, @3, @5 ];
    NSArray *newArray = @[ @1, @1, @3, @3, @5, @5 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 3, @"3 items added.");
    XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
    XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 3, @"3 items unchanged.");
    
    NSMutableIndexSet *addedIndices = [[NSMutableIndexSet alloc] init];
    [addedIndices addIndex:1];
    [addedIndices addIndex:3];
    [addedIndices addIndex:5];
    XCTAssert([delta.addedIndices isEqual:addedIndices], @"equal.");
    NSMutableArray *unchangedIndexPairs = [[NSMutableArray alloc] init];
    [unchangedIndexPairs addObject:@[ @0, @0 ]];
    [unchangedIndexPairs addObject:@[ @1, @2 ]];
    [unchangedIndexPairs addObject:@[ @2, @4 ]];
    XCTAssert([delta.unchangedIndexPairs isEqual:unchangedIndexPairs], @"equal.");
}

- (void)testDeletion {
    NSArray *oldArray = @[ @0, @1, @2, @3, @4, @5, @6 ];
    NSArray *newArray = @[ @1, @3, @5 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
    XCTAssert(delta.removedIndices.count == 4, @"4 items removed.");
    XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 3, @"3 items unchanged.");
}

- (void)testDeleteDuplicate {
    NSArray *oldArray = @[ @1, @1, @3, @3, @5, @5 ];
    NSArray *newArray = @[ @1, @3, @5 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
    XCTAssert(delta.removedIndices.count == 3, @"3 items removed.");
    XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 3, @"3 items unchanged.");
}

- (void)testMove {
    NSArray *oldArray = @[ @0, @1, @2, @3, @4, @5 ];
    NSArray *newArray = @[ @2, @5, @0, @3, @4, @1 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 0, @"0 item added.");
    XCTAssert(delta.removedIndices.count == 0, @"0 item removed.");
    XCTAssert(delta.movedIndexPairs.count == 4, @"4 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 2, @"1 item unchanged.");
}

- (void)testInsertionAndDeletion {
    NSArray *oldArray = @[ @1, @2, @3, @4, @5, @6 ];
    NSArray *newArray = @[ @0, @1, @2, @3, @4, @5 ];
    
    LXDeltaCalculator *defaultCalculator = [LXDeltaCalculator defaultCalculator];
    
    LXDelta *delta = [defaultCalculator deltaFromOldArray:oldArray toNewArray:newArray];
    XCTAssert(delta.addedIndices.count == 1, @"1 item added.");
    XCTAssert(delta.removedIndices.count == 1, @"1 item removed.");
    XCTAssert(delta.movedIndexPairs.count == 0, @"0 item moved.");
    XCTAssert(delta.unchangedIndexPairs.count == 5, @"5 items unchanged.");
}

@end
