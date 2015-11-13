//
//  TDADomain.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "TDADomain.h"
#import "TDAToDoStore.h"

@implementation TDADomain

- (void)setup {
    [self registerStore:[TDAToDoStore new]];
}

- (TDAToDoStore *)toDoStore {
    return (TDAToDoStore *)[self getStoreByClass:[TDAToDoStore class]];
}

@end
