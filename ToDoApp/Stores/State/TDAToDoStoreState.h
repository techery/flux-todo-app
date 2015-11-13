#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

#import "TEBaseState.h"



@class TDAToDoStoreStateBuilder;

@interface TDAToDoStoreState : TEBaseState
@property(nonatomic, strong, readonly) NSArray *items;

+ (TDAToDoStoreState*)create:(void(^)(TDAToDoStoreStateBuilder *builder))builder;
- (TDAToDoStoreState*)mutate:(void(^)(TDAToDoStoreStateBuilder *builder))builder;

@end

@interface TDAToDoStoreStateBuilder : TEBaseState

@property(nonatomic, strong, readwrite) NSArray *items;

@end

