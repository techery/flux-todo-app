#import "TDAToDoStoreState.h"

@class TDAToDoStoreState;


@implementation TDAToDoStoreState {
    int __modelVersion;
}





+ (TDAToDoStoreState*)create:(void(^)(TDAToDoStoreStateBuilder *builder))builderBlock
{
    TDAToDoStoreStateBuilder *builder = [TDAToDoStoreStateBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAToDoStoreStateBuilder *builder = [TDAToDoStoreStateBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAToDoStoreStateBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _items = builder.items;
    }

    return self;
}

- (TDAToDoStoreState*)mutate:(void(^)(TDAToDoStoreStateBuilder *builder))builderBlock
{
    TDAToDoStoreStateBuilder *builder = [TDAToDoStoreStateBuilder new];

    builder.items = self.items;

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

- (BOOL)isEqualToOther:(TDAToDoStoreState *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.items != object.items)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.items hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", items=%@", self.items];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _items = [coder decodeObjectForKey:@"_items"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.items forKey:@"_items"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAToDoStoreState *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_items = _items;
    }

    return copy;
}


@end

@implementation TDAToDoStoreStateBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end

