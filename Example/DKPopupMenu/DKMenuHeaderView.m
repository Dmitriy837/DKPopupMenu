//
//  DKMenuHeaderView.m
//  DKPopupMenu
//
//  Created by Dmitriy Kovryhin on 12/1/16.
//  Copyright © 2016 DmytroKovryhin. All rights reserved.
//

#import "DKMenuHeaderView.h"

@implementation DKMenuHeaderView
{
    UILabel *titleLabel;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        titleLabel = [UILabel new];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:titleLabel];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[titleLabel]-10@999-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[titleLabel]-10@999-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)]];
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.numberOfLines = 0;
        [titleLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    titleLabel.text = title;
}

@end
