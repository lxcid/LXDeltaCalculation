//
//  LXDeltaCalculator.h
//  LXDeltaCalculation
//
//  Created by Stan Chang Khin Boon on 3/3/15.
//  Copyright (c) 2015 lxcid. All rights reserved.
//

@import Foundation;

@class LXDelta;

typedef BOOL (^lx_delta_calculator_equality_test_t)(id a, id b);

extern const lx_delta_calculator_equality_test_t LXDeltaCalculatorDefaultEqualityTest;

@interface LXDeltaCalculator : NSObject

+ (instancetype)defaultCalculator;

+ (instancetype)deltaCalculatorWithEqualityTest:(lx_delta_calculator_equality_test_t)equalityTest;

- (instancetype)initWithEqualityTest:(lx_delta_calculator_equality_test_t)equalityTest;

/**
 Resolve differences between two versions of an array.
 
 @param oldArray the array representing the "old" version of the array
 @param newArray the array representing the "new" version of the array.
 @return A delta object containing NSIndexSets representing added, moved, removed, and unchanged elements.
 */
- (LXDelta *)deltaFromOldArray:(NSArray *)oldArray toNewArray:(NSArray *)newArray;

@end
