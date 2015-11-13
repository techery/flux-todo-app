#import "TDAToDoStoreActions.h"

@class TDAOnToDoItemInsert;
@class TDAOnToDoItemDelete;
@class TDAOnToDoItemUpdate;
@class TDAOnToDoItemMarkAsDone;


@implementation TDAOnToDoItemInsert {
    int __modelVersion;
}





+ (TDAOnToDoItemInsert*)create:(void(^)(TDAOnToDoItemInsertBuilder *builder))builderBlock
{
    TDAOnToDoItemInsertBuilder *builder = [TDAOnToDoItemInsertBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAOnToDoItemInsertBuilder *builder = [TDAOnToDoItemInsertBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAOnToDoItemInsertBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _text = builder.text;
    }

    return self;
}

- (TDAOnToDoItemInsert*)mutate:(void(^)(TDAOnToDoItemInsertBuilder *builder))builderBlock
{
    TDAOnToDoItemInsertBuilder *builder = [TDAOnToDoItemInsertBuilder new];

    builder.text = self.text;

    builderBlock(builder);

    return [[[self class] alloc] initWithBuilder:builder modelVersion:__modelVersion + 1];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToOther:other];
}

- (BOOL)isEqualToOther:(TDAOnToDoItemInsert *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.text != object.text)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.text hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", text=%@", self.text];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _text = [coder decodeObjectForKey:@"_text"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:@"_text"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAOnToDoItemInsert *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_text = _text;
    }

    return copy;
}


@end

@implementation TDAOnToDoItemInsertBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end


@implementation TDAOnToDoItemDelete {
    int __modelVersion;
}





+ (TDAOnToDoItemDelete*)create:(void(^)(TDAOnToDoItemDeleteBuilder *builder))builderBlock
{
    TDAOnToDoItemDeleteBuilder *builder = [TDAOnToDoItemDeleteBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAOnToDoItemDeleteBuilder *builder = [TDAOnToDoItemDeleteBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAOnToDoItemDeleteBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _item = builder.item;
    }

    return self;
}

- (TDAOnToDoItemDelete*)mutate:(void(^)(TDAOnToDoItemDeleteBuilder *builder))builderBlock
{
    TDAOnToDoItemDeleteBuilder *builder = [TDAOnToDoItemDeleteBuilder new];

    builder.item = self.item;

    builderBlock(builder);

    return [[[self class] alloc] initWithBuilder:builder modelVersion:__modelVersion + 1];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToOther:other];
}

- (BOOL)isEqualToOther:(TDAOnToDoItemDelete *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.item != object.item)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.item hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", item=%@", self.item];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _item = [coder decodeObjectForKey:@"_item"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.item forKey:@"_item"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAOnToDoItemDelete *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_item = _item;
    }

    return copy;
}


@end

@implementation TDAOnToDoItemDeleteBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end


@implementation TDAOnToDoItemUpdate {
    int __modelVersion;
}





+ (TDAOnToDoItemUpdate*)create:(void(^)(TDAOnToDoItemUpdateBuilder *builder))builderBlock
{
    TDAOnToDoItemUpdateBuilder *builder = [TDAOnToDoItemUpdateBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAOnToDoItemUpdateBuilder *builder = [TDAOnToDoItemUpdateBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAOnToDoItemUpdateBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _item = builder.item;
    }

    return self;
}

- (TDAOnToDoItemUpdate*)mutate:(void(^)(TDAOnToDoItemUpdateBuilder *builder))builderBlock
{
    TDAOnToDoItemUpdateBuilder *builder = [TDAOnToDoItemUpdateBuilder new];

    builder.item = self.item;

    builderBlock(builder);

    return [[[self class] alloc] initWithBuilder:builder modelVersion:__modelVersion + 1];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToOther:other];
}

- (BOOL)isEqualToOther:(TDAOnToDoItemUpdate *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.item != object.item)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.item hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", item=%@", self.item];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _item = [coder decodeObjectForKey:@"_item"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.item forKey:@"_item"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAOnToDoItemUpdate *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_item = _item;
    }

    return copy;
}


@end

@implementation TDAOnToDoItemUpdateBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end


@implementation TDAOnToDoItemMarkAsDone {
    int __modelVersion;
}





+ (TDAOnToDoItemMarkAsDone*)create:(void(^)(TDAOnToDoItemMarkAsDoneBuilder *builder))builderBlock
{
    TDAOnToDoItemMarkAsDoneBuilder *builder = [TDAOnToDoItemMarkAsDoneBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAOnToDoItemMarkAsDoneBuilder *builder = [TDAOnToDoItemMarkAsDoneBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAOnToDoItemMarkAsDoneBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _item = builder.item;
    }

    return self;
}

- (TDAOnToDoItemMarkAsDone*)mutate:(void(^)(TDAOnToDoItemMarkAsDoneBuilder *builder))builderBlock
{
    TDAOnToDoItemMarkAsDoneBuilder *builder = [TDAOnToDoItemMarkAsDoneBuilder new];

    builder.item = self.item;

    builderBlock(builder);

    return [[[self class] alloc] initWithBuilder:builder modelVersion:__modelVersion + 1];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToOther:other];
}

- (BOOL)isEqualToOther:(TDAOnToDoItemMarkAsDone *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.item != object.item)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.item hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", item=%@", self.item];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _item = [coder decodeObjectForKey:@"_item"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.item forKey:@"_item"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAOnToDoItemMarkAsDone *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_item = _item;
    }

    return copy;
}


@end

@implementation TDAOnToDoItemMarkAsDoneBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end

