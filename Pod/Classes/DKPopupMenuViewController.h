//
//  DKPopupMenuViewController.h
//  PopupMenu
//
//  Created by Dmytro Kovryhin on 3/20/16.
//  Copyright (c) 2016 Dmytro Kovryhin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKPopupAction.h"

@interface DKPopupMenuViewController : UIViewController
@property (nonatomic, assign) CGFloat cellHeight;
- (void)setCustomBackgroundView:(UIView *)customBackgroundView;

//The simplest case
- (void)addActionWithTitle:(NSString*)title ofType:(DKActionType)type handler:(actionBlock)actionBlock;
- (void)show;
- (void)hideMenu;

//The most general case
- (void)addAction:(id<DKCallablePopupAction>)action;
- (void)showUsingCellNib:(UINib*)cellNib;
@end
