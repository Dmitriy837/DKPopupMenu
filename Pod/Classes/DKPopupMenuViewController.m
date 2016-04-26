//
//  DKPopupMenuViewController.m
//  PopupMenu
//
//  Created by Dmytro Kovryhin on 3/20/16.
//  Copyright (c) 2016 Dmytro Kovryhin. All rights reserved.
//

#import "DKPopupMenuViewController.h"
#import "DKPopupMenuTableViewCell.h"

#define DKDefaultCellHeight 65
#define DKCustomCellReuseIdentifier @"DKCustomCellReuseIdentifier"

@interface DKPopupMenuViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, weak)IBOutlet UITableView *tableView;
@property (nonatomic, weak)IBOutlet UIView *pseudoBackground;
@property (nonatomic, weak)IBOutlet NSLayoutConstraint *tableViewHeightConstraint;
@property (nonatomic, weak)IBOutlet NSLayoutConstraint *tableViewBottomConstraint;
@property (nonatomic, weak) UIView *customBackgroundView;
@end

static DKPopupMenuViewController *instance;
@implementation DKPopupMenuViewController
{
    UINib *cellNib;
}

#pragma mark - Setup routine

- (instancetype)init
{
    NSBundle *bundle = [NSBundle bundleForClass:self.classForCoder];
    self = [[UIStoryboard storyboardWithName:@"PopupMenu" bundle:bundle] instantiateInitialViewController];
    if (self)
    {
        self.actions = [NSMutableArray new];
    }
    instance = self;
    return self;
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.view];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = @{@"view":self.view};
    [[UIApplication sharedApplication].keyWindow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:viewsDictionary]];
    [[UIApplication sharedApplication].keyWindow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:viewsDictionary]];
}

- (void)showUsingCellNib:(UINib*)_cellNib
{
    cellNib = _cellNib;
    [self show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (cellNib)
    {
        [self.tableView registerNib:cellNib forCellReuseIdentifier:DKCustomCellReuseIdentifier];
        UITableViewCell *cell = [[cellNib instantiateWithOwner:nil options:nil] firstObject];
        self.cellHeight = cell.bounds.size.height;
    }
}

- (void)hideMenu
{
    [UIView animateWithDuration:0.25 animations:^{
        self.pseudoBackground.alpha = 0.1;
        self.customBackgroundView.alpha = 0.1;
        self.tableViewBottomConstraint.constant = - self.tableViewHeightConstraint.constant;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        instance = nil;
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tableViewHeightConstraint.constant = self.actions.count * self.cellHeight;
    self.tableViewBottomConstraint.constant = - self.tableViewHeightConstraint.constant;
    if (self.customBackgroundView) {
        [self.pseudoBackground removeFromSuperview];
    }
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        self.pseudoBackground.alpha = 0.7;
        self.customBackgroundView.alpha = 1.0;
        self.tableViewBottomConstraint.constant = 0.0f;
        [self.view layoutIfNeeded];
    }];
}

- (CGFloat)cellHeight
{
    if (_cellHeight <= 0)
    {
        _cellHeight = DKDefaultCellHeight;
    }
    return _cellHeight;
}

- (void)setCustomBackgroundView:(UIView *)customBackgroundView
{
    _customBackgroundView = customBackgroundView;
    customBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:customBackgroundView];
    customBackgroundView.alpha = 0.0;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customBackgroundView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(customBackgroundView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customBackgroundView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(customBackgroundView)]];
    [self.view sendSubviewToBack:customBackgroundView];
}

#pragma mark - Add actions

- (void)addActionWithTitle:(NSString *)title ofType:(DKActionType)type handler:(actionBlock)actionBlock
{
    DKPopupAction *action = [DKPopupAction new];
    action.actionType = type;
    action.handlerBlock = actionBlock;
    action.title = title;
    [self addAction:action];
}

- (void)addAction:(id<DKCallablePopupAction>)action
{
    [self.actions addObject:action];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.actions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DKCallablePopupAction> action = self.actions[indexPath.row];
    UITableViewCell<DKPopupMenuActionCell> *cell;
    if ([action isKindOfClass:[DKPopupAction class]])
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:[DKPopupMenuTableViewCell cellReuseIdentifierOfType:[(DKPopupAction*)action actionType]] forIndexPath:indexPath];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:DKCustomCellReuseIdentifier forIndexPath:indexPath];
    }
    cell.action = action;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DKCallablePopupAction> action = self.actions[indexPath.row];
    [self hideMenu];
    if (action.handlerBlock)
    {
        action.handlerBlock();
    }
}

@end
