//
//  TDAToDoStore.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "TDAToDoStore.h"
#import "TEStoreDispatcher.h"
#import "TDAToDoStoreActions.h"
#import "NSArray+Functional.h"

@implementation TDAToDoStore
@dynamic state;

- (void)registerWithLocalDispatcher:(TEStoreDispatcher *)storeDispatcher {
    [storeDispatcher onAction:[TDAOnToDoItemInsert class] callback:^TEBaseState *(TDAOnToDoItemInsert *action) {
       return [self.state mutate:^(TDAToDoStoreStateBuilder *builder) {
           TDAToDoItem *toDoItem = [self toDoItemWithText:action.text];
           builder.items = [builder.items arrayByAddingObjectsFromArray:@[toDoItem]];
       }];
    }];
    
    [storeDispatcher onAction:[TDAOnToDoItemDelete class] callback:^TEBaseState *(TDAOnToDoItemDelete *action) {
        return [self.state mutate:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = [builder.items filter:^BOOL(TDAToDoItem *toDoItem) {
                return (![toDoItem.uuid isEqualToString:action.item.uuid]);
            }];
        }];
    }];
    
    [storeDispatcher onAction:[TDAOnToDoItemUpdate class] callback:^TEBaseState *(TDAOnToDoItemUpdate *action) {
        return [self.state mutate:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = [builder.items map:^id(TDAToDoItem *toDoItem) {
                if ([toDoItem.uuid isEqualToString:action.item.uuid]) {
                    return action.item;
                }
                return toDoItem;
            }];
        }];
    }];
    
    [storeDispatcher onAction:[TDAOnToDoItemMarkAsDone class] callback:^TEBaseState *(TDAOnToDoItemMarkAsDone *action) {
        return [self.state mutate:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = [builder.items map:^id(TDAToDoItem *toDoItem) {
                if ([toDoItem.uuid isEqualToString:action.item.uuid]) {
                    return [toDoItem mutate:^(TDAToDoItemBuilder *builder) {
                        builder.isDone = YES;
                    }];
                }
                return toDoItem;
            }];
        }];
    }];
}

- (TDAToDoStoreState *)defaultState {
    return [TDAToDoStoreState create:^(TDAToDoStoreStateBuilder *builder) {
        builder.items = @[];
    }];
}

- (TDAToDoItem *)toDoItemWithText:(NSString *)text {
    return [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
        builder.uuid = [[NSUUID UUID] UUIDString];
        builder.text = text;
        builder.isDone = NO;
        builder.createdAt = [NSDate date];
    }];
}

@end
