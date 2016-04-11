//
//  DKPopupMenuTableViewCell.m
//  PopupMenu
//
//  Created by Dmytro Kovryhin on 3/20/16.
//  Copyright (c) 2016 Dmytro Kovryhin. All rights reserved.
//

#import "DKPopupMenuTableViewCell.h"
@interface DKPopupMenuTableViewCell()
@property (nonatomic, weak) IBOutlet UILabel *titleTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *additionalInfoTextLabel;
@end

@implementation DKPopupMenuTableViewCell

+ (NSString*)cellReuseIdentifierNormal
{
    return @"DKPopupMenuTableViewCellReuseNormal";
}

+ (NSString*)cellReuseIdentifierDestructive
{
    return @"DKPopupMenuTableViewCellReuseDestructive";
}

- (void)setAction:(DKPopupAction *)action
{
    _action = action;
    self.titleTextLabel.text = self.action.title;
}

+ (NSString*)cellReuseIdentifierOfType:(DKActionType)type
{
    switch (type) {
        case DKActionTypeNormal:
            return [self cellReuseIdentifierNormal];
            break;
        case DKActionTypeCancel:
            return [self cellReuseIdentifierDestructive];
        default:
            return nil;
            break;
    }
}
@end
