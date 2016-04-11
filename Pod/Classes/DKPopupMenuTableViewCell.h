//
//  DKPopupMenuTableViewCell.h
//  PopupMenu
//
//  Created by Dmytro Kovryhin on 3/20/16.
//  Copyright (c) 2016 Dmytro Kovryhin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKPopupAction.h"

@protocol DKPopupMenuActionCell <NSObject>
- (void)setAction:(id<DKCallablePopupAction>)action;
@end

@interface DKPopupMenuTableViewCell : UITableViewCell<DKPopupMenuActionCell>
@property (nonatomic, weak) DKPopupAction *action;
+ (NSString*)cellReuseIdentifierOfType:(DKActionType)type;
@end
