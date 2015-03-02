//
//  LXDelta.h
//  LXDeltaCalculation
//
//  Created by Stan Chang Khin Boon on 3/3/15.
//  Copyright (c) 2015 lxcid. All rights reserved.
//

@import Foundation;

@interface LXDelta : NSObject

@property (nonatomic, copy, readonly) NSIndexSet *addedIndices;
@property (nonatomic, copy, readonly) NSIndexSet *removedIndices;
@property (nonatomic, copy, readonly) NSArray *movedIndexPairs;
@property (nonatomic, copy, readonly) NSArray *unchangedIndexPairs;

+ (instancetype)deltaWithAddedIndices:(NSIndexSet *)addedIndices
                       removedIndices:(NSIndexSet *)removedIndices
                      movedIndexPairs:(NSArray *)movedIndexPairs
                  unchangedIndexPairs:(NSArray *)unchangedIndexPairs;

- (instancetype)initWithAddedIndices:(NSIndexSet *)addedIndices
                      removedIndices:(NSIndexSet *)removedIndices
                     movedIndexPairs:(NSArray *)movedIndexPairs
                 unchangedIndexPairs:(NSArray *)unchangedIndexPairs;

@end
