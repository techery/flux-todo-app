//
//  TDAToDoStoreSpec.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TDAToDoStore.h"
#import "TDAToDoStoreActions.h"
#import "TEStoreDispatcher.h"

SPEC_BEGIN(TDAToDoStoreSpec)

__block TDAToDoStore *sut;

beforeEach(^{
    sut = [TDAToDoStore new];
});

afterEach(^{
    sut = nil;
});

describe(@"Initializing", ^{
    it(@"Should set default state", ^{
        [[sut.state shouldNot] beNil];
    });
    
    it(@"Should initialize empty items array in default state", ^{
        [[sut.state.items shouldNot] beNil];
        [[sut.state.items should] beEmpty];
    });
});

describe(@"Store registration", ^{
    __block id dispatcherMock;
    
    beforeEach(^{
        dispatcherMock = [KWMock mockForClass:[TEStoreDispatcher class]];
    });
    
    afterEach(^{
        dispatcherMock = nil;
    });
    
    it(@"Should register callbacks for actions", ^{
        [[dispatcherMock should] receive:@selector(onAction:callback:) withArguments:[TDAOnToDoItemInsert class], any()];
        [[dispatcherMock should] receive:@selector(onAction:callback:) withArguments:[TDAOnToDoItemUpdate class], any()];
        [[dispatcherMock should] receive:@selector(onAction:callback:) withArguments:[TDAOnToDoItemDelete class], any()];
        [[dispatcherMock should] receive:@selector(onAction:callback:) withArguments:[TDAOnToDoItemMarkAsDone class], any()];
        [sut registerWithLocalDispatcher:dispatcherMock];
    });
});

describe(@"Store actions", ^{
    __block TEStoreDispatcher *storeDispatcher;
    
    beforeEach(^{
        storeDispatcher = [[TEStoreDispatcher alloc] initWithStore:sut];
    });
    
    afterEach(^{
        storeDispatcher = nil;
    });
    
    it(@"Should insert new item", ^{
        TDAOnToDoItemInsert *insertAction = [TDAOnToDoItemInsert create:^(TDAOnToDoItemInsertBuilder *builder) {
            builder.text = @"Test";
        }];
        [storeDispatcher dispatchAction:insertAction];
        [[sut.state.items shouldNot] beEmpty];
        [[sut.state.items should] haveCountOf:1];
        
        TDAToDoItem *item = [sut.state.items firstObject];
        [[item.uuid shouldNot] beNil];
        [[item.text should] equal:@"Test"];
        [[item.createdAt shouldNot] beNil];
        [[theValue(item.isDone) should] beFalse];
    });
    
    it(@"Should delete item", ^{
        TDAToDoItem *firstItem = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
            builder.uuid = @"1";
        }];
        
        TDAToDoItem *secondItem = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
            builder.uuid = @"2";
        }];
        
        TDAToDoStoreState *state = [TDAToDoStoreState create:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = @[firstItem, secondItem];
        }];
        
        [sut setValue:state forKey:@"state"];
        
        TDAOnToDoItemDelete *deleteAction = [TDAOnToDoItemDelete create:^(TDAOnToDoItemDeleteBuilder *builder) {
            builder.item = firstItem;
        }];
        
        [storeDispatcher dispatchAction:deleteAction];
        
        [[sut.state.items should] equal:@[secondItem]];
    });
    
    it(@"Should update item", ^{
        TDAToDoItem *item = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
            builder.uuid = @"1";
        }];
        
        TDAToDoItem *updatedItem = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
            builder.uuid = @"1";
        }];
        
        TDAToDoStoreState *state = [TDAToDoStoreState create:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = @[item];
        }];
        
        [sut setValue:state forKey:@"state"];
        
        TDAOnToDoItemUpdate *updateAction = [TDAOnToDoItemUpdate create:^(TDAOnToDoItemUpdateBuilder *builder) {
            builder.item = updatedItem;
        }];
        
        [storeDispatcher dispatchAction:updateAction];
        
        [[sut.state.items should] equal:@[updatedItem]];
    });
    
    it(@"Should mark as done", ^{
        TDAToDoItem *item = [TDAToDoItem create:^(TDAToDoItemBuilder *builder) {
            builder.uuid = @"1";
        }];
        
        TDAToDoStoreState *state = [TDAToDoStoreState create:^(TDAToDoStoreStateBuilder *builder) {
            builder.items = @[item];
        }];
        
        [sut setValue:state forKey:@"state"];
        
        TDAOnToDoItemMarkAsDone *markAsDoneAction = [TDAOnToDoItemMarkAsDone create:^(TDAOnToDoItemMarkAsDoneBuilder *builder) {
            builder.item = item;
        }];
        
        [storeDispatcher dispatchAction:markAsDoneAction];
        
        TDAToDoItem *markedItem = [sut.state.items firstObject];
        [[markedItem.uuid should] equal:@"1"];
        [[theValue(markedItem.isDone) should] beTrue];
    });
});

SPEC_END

