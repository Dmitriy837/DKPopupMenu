//
//  DKAction.h
//  PopupMenu
//
//  Created by Dmytro Kovryhin on 3/20/16.
//  Copyright (c) 2016 Dmytro Kovryhin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^actionBlock)();

@protocol DKCallablePopupAction <NSObject>
- (actionBlock)handlerBlock;
@end

typedef enum {
    DKActionTypeNormal,
    DKActionTypeCancel
} DKActionType;

@interface DKPopupAction : NSObject<DKCallablePopupAction>
@property (nonatomic, copy) actionBlock handlerBlock;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) DKActionType actionType;
@end
