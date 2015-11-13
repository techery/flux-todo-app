//
//  TDADomain.h
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "TEDomain.h"
#import <AppleGuice/AppleGuice.h>

@class TDAToDoStore;

@interface TDADomain : TEDomain <AppleGuiceSingleton, AppleGuiceInjectable>

- (TDAToDoStore *)toDoStore;

@end
