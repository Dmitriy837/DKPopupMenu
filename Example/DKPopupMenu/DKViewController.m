//
//  DKViewController.m
//  DKPopupMenu
//
//  Created by DmytroKovryhin on 03/20/2016.
//  Copyright (c) 2016 DmytroKovryhin. All rights reserved.
//

#import "DKViewController.h"
#import <DKPopupMenu/DKPopupMenuViewController.h>
#import "DKTableViewCellWithAction.h"
#import "DKMenuHeaderView.h"

@interface DKViewController ()

@end

@implementation DKViewController

- (IBAction)showSimpleMenu
{
    DKPopupMenuViewController *menu = [DKPopupMenuViewController new];
    UIView *background = [UIView new];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:menu action:@selector(hideMenu)];
    [background addGestureRecognizer:tgr];
    background.backgroundColor = [UIColor colorWithRed:0.3 green:0.45 blue:0.3 alpha:0.3];
    [menu setCustomBackgroundView:background];
    [menu addActionWithTitle:@"Boring title 1" ofType:DKActionTypeNormal handler:^{
        NSLog(@"Boring title 1 has been chosen");
    }];
    [menu addActionWithTitle:@"Boring title 2" ofType:DKActionTypeNormal handler:^{
        NSLog(@"Boring title 2 has been chosen");
    }];
    [menu addActionWithTitle:@"Boring title 3" ofType:DKActionTypeNormal handler:^{
        NSLog(@"Boring title 3 has been chosen");
    }];
    [menu addActionWithTitle:@"Cancel" ofType:DKActionTypeCancel handler:nil];
    DKMenuHeaderView *headerView = [DKMenuHeaderView new];
    [headerView setTitle:@"You can now tap above the menu \nto hide it"];
    menu.headerView = headerView;
    [menu show];
}

- (IBAction)showMenuWithCustomCells
{
    DKPopupMenuViewController *menu = [DKPopupMenuViewController new];
    [menu addActionWithTitle:@"Elephant" icon:[UIImage imageNamed:@"elephant"] handler:^{
        NSLog(@"Elephant has been chosen");
    }];
    [menu addActionWithTitle:@"Hippopotamus" icon:[UIImage imageNamed:@"hippopotamus"] handler:^{
        NSLog(@"Hippopotamus has been chosen");
    }];
    [menu addActionWithTitle:@"Panda" icon:[UIImage imageNamed:@"panda"] handler:^{
        NSLog(@"Panda has been chosen");
    }];
    [menu addActionWithTitle:@"Cancel" icon:nil handler:nil];
    [menu showUsingCellNib:[UINib nibWithNibName:@"DKTableViewCellWithAction" bundle:nil]];
}

@end
