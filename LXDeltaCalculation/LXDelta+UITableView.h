//
//  LXDelta+UITableView.h
//  LXDeltaCalculation
//
//  Created by Stan Chang Khin Boon on 3/3/15.
//  Copyright (c) 2015 lxcid. All rights reserved.
//

#import "LXDelta.h"

@import UIKit;

@interface LXDelta (UITableView)

- (void)applyUpdatesToTableView:(UITableView *)tableView inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
