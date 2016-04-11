//
//  DKTableViewCellWithAction.m
//  DKPopupMenu
//
//  Created by Dmitriy Kovryhin on 4/5/16.
//  Copyright © 2016 DmytroKovryhin. All rights reserved.
//

#import "DKTableViewCellWithAction.h"

@implementation DKPopupMenuViewController(MyCustomCell)
- (void)addActionWithTitle:(NSString*)title icon:(UIImage*)icon handler:(actionBlock)actionBlock
{
    DKCustomAction *action = [DKCustomAction new];
    action.actionIcon = icon;
    action.handlerBlock = actionBlock;
    action.actionTitle = title;
    [self addAction:action];
}
@end

@implementation DKCustomAction
@end

@interface DKTableViewCellWithAction()
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@end

@implementation DKTableViewCellWithAction

- (void)setAction:(DKCustomAction *)action
{
    self.iconImageView.image = action.actionIcon;
    self.titleLabel.text = action.actionTitle;
    if (!action.actionIcon) {
        self.contentView.backgroundColor = [UIColor darkGrayColor];
    }
}

@end
