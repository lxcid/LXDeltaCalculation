//
//  LXDelta+UITableView.m
//  LXDeltaCalculation
//
//  Created by Stan Chang Khin Boon on 3/3/15.
//  Copyright (c) 2015 lxcid. All rights reserved.
//

#import "LXDelta+UITableView.h"

@implementation LXDelta (UITableView)

- (void)applyUpdatesToTableView:(UITableView *)tableView inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)rowAnimation {
    NSMutableArray *removedIndexPaths = [NSMutableArray arrayWithCapacity:self.removedIndices.count];
    [self.removedIndices enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
        [removedIndexPaths addObject:indexPath];
    }];
    
    [tableView deleteRowsAtIndexPaths:removedIndexPaths withRowAnimation:rowAnimation];
    
    NSMutableArray *addedIndexPaths = [NSMutableArray arrayWithCapacity:self.addedIndices.count];
    [self.addedIndices enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
        [addedIndexPaths addObject:indexPath];
    }];
    
    [tableView insertRowsAtIndexPaths:addedIndexPaths withRowAnimation:rowAnimation];
    
    [self.movedIndexPairs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSNumber *fromIndex = [obj objectAtIndex:0], *toIndex = [obj objectAtIndex:1];
        NSIndexPath *fromIndexPath = [NSIndexPath indexPathForRow:[fromIndex unsignedIntegerValue] inSection:section];
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:[toIndex unsignedIntegerValue] inSection:section];
        [tableView moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
    }];
}

@end
