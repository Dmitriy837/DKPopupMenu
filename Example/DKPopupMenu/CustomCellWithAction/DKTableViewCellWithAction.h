//
//  DKTableViewCellWithAction.h
//  DKPopupMenu
//
//  Created by Dmitriy Kovryhin on 4/5/16.
//  Copyright © 2016 DmytroKovryhin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DKPopupMenu/DKPopupMenuTableViewCell.h>
#import <DKPopupMenu/DKPopupMenuViewController.h>

//I would recommend to create this kind of convenience methods in categories for each and every custom cell to keep your UIViewController somewhat cleaner. Still it has a lot of work to do
@interface DKPopupMenuViewController(MyCustomCell)
- (void)addActionWithTitle:(NSString*)title icon:(UIImage*)icon handler:(actionBlock)actionBlock;
@end

@interface DKCustomAction : NSObject<DKCallablePopupAction>
@property (nonatomic, strong) UIImage *actionIcon;
@property (nonatomic, strong) NSString *actionTitle;
@property (nonatomic, copy) actionBlock handlerBlock;
@end

@interface DKTableViewCellWithAction : UITableViewCell<DKPopupMenuActionCell>
@property (nonatomic, strong) DKCustomAction *action;
@end
