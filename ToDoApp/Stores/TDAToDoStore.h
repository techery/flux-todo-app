//
//  TDAToDoStore.h
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "TEBaseStore.h"
#import "TDAToDoStoreState.h"

@interface TDAToDoStore : TEBaseStore

@property (nonatomic, strong, readonly) TDAToDoStoreState *state;

@end
