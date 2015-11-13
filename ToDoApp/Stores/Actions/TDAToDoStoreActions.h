#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

#import "TEBaseAction.h"
#import "TDAToDoItem.h"



@class TDAOnToDoItemInsertBuilder;

@interface TDAOnToDoItemInsert : TEBaseAction
@property(nonatomic, strong, readonly) NSString *text;

+ (TDAOnToDoItemInsert*)create:(void(^)(TDAOnToDoItemInsertBuilder *builder))builder;
- (TDAOnToDoItemInsert*)mutate:(void(^)(TDAOnToDoItemInsertBuilder *builder))builder;

@end

@interface TDAOnToDoItemInsertBuilder : TEBaseAction

@property(nonatomic, strong, readwrite) NSString *text;

@end


@class TDAOnToDoItemDeleteBuilder;

@interface TDAOnToDoItemDelete : TEBaseAction
@property(nonatomic, strong, readonly) TDAToDoItem *item;

+ (TDAOnToDoItemDelete*)create:(void(^)(TDAOnToDoItemDeleteBuilder *builder))builder;
- (TDAOnToDoItemDelete*)mutate:(void(^)(TDAOnToDoItemDeleteBuilder *builder))builder;

@end

@interface TDAOnToDoItemDeleteBuilder : TEBaseAction

@property(nonatomic, strong, readwrite) TDAToDoItem *item;

@end


@class TDAOnToDoItemUpdateBuilder;

@interface TDAOnToDoItemUpdate : TEBaseAction
@property(nonatomic, strong, readonly) TDAToDoItem *item;

+ (TDAOnToDoItemUpdate*)create:(void(^)(TDAOnToDoItemUpdateBuilder *builder))builder;
- (TDAOnToDoItemUpdate*)mutate:(void(^)(TDAOnToDoItemUpdateBuilder *builder))builder;

@end

@interface TDAOnToDoItemUpdateBuilder : TEBaseAction

@property(nonatomic, strong, readwrite) TDAToDoItem *item;

@end


@class TDAOnToDoItemMarkAsDoneBuilder;

@interface TDAOnToDoItemMarkAsDone : TEBaseAction
@property(nonatomic, strong, readonly) TDAToDoItem *item;

+ (TDAOnToDoItemMarkAsDone*)create:(void(^)(TDAOnToDoItemMarkAsDoneBuilder *builder))builder;
- (TDAOnToDoItemMarkAsDone*)mutate:(void(^)(TDAOnToDoItemMarkAsDoneBuilder *builder))builder;

@end

@interface TDAOnToDoItemMarkAsDoneBuilder : TEBaseAction

@property(nonatomic, strong, readwrite) TDAToDoItem *item;

@end

