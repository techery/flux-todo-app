#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>




@class TDAToDoItemBuilder;

@interface TDAToDoItem : NSObject
@property(nonatomic, strong, readonly) NSString *uuid;
@property(nonatomic, strong, readonly) NSString *text;
@property(nonatomic, assign, readonly) BOOL isDone;
@property(nonatomic, strong, readonly) NSDate *createdAt;

+ (TDAToDoItem*)create:(void(^)(TDAToDoItemBuilder *builder))builder;
- (TDAToDoItem*)mutate:(void(^)(TDAToDoItemBuilder *builder))builder;

@end

@interface TDAToDoItemBuilder : NSObject

@property(nonatomic, strong, readwrite) NSString *uuid;
@property(nonatomic, strong, readwrite) NSString *text;
@property(nonatomic, assign, readwrite) BOOL isDone;
@property(nonatomic, strong, readwrite) NSDate *createdAt;

@end

