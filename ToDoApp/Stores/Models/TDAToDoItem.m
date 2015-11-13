#import "TDAToDoItem.h"

@class TDAToDoItem;


@implementation TDAToDoItem {
    int __modelVersion;
}





+ (TDAToDoItem*)create:(void(^)(TDAToDoItemBuilder *builder))builderBlock
{
    TDAToDoItemBuilder *builder = [TDAToDoItemBuilder new];
    if(builderBlock)
    {
        builderBlock(builder);
    }
    return [[self alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)init
{
    TDAToDoItemBuilder *builder = [TDAToDoItemBuilder new];
    return [[[self class] alloc] initWithBuilder:builder modelVersion:1];
}

- (instancetype)initWithBuilder:(TDAToDoItemBuilder*)builder modelVersion:(int)modelVersion
{
self = [super init];

    if (self) {
        __modelVersion = modelVersion;
        _uuid = builder.uuid;
        _text = builder.text;
        _isDone = builder.isDone;
        _createdAt = builder.createdAt;
    }

    return self;
}

- (TDAToDoItem*)mutate:(void(^)(TDAToDoItemBuilder *builder))builderBlock
{
    TDAToDoItemBuilder *builder = [TDAToDoItemBuilder new];

    builder.uuid = self.uuid;
    builder.text = self.text;
    builder.isDone = self.isDone;
    builder.createdAt = self.createdAt;

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

- (BOOL)isEqualToOther:(TDAToDoItem *)object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.uuid != object.uuid)
        return NO;
    if (self.text != object.text)
        return NO;
    if (self.isDone != object.isDone)
        return NO;
    if (self.createdAt != object.createdAt)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    hash = hash * 31u + [self.uuid hash];
    hash = hash * 31u + [self.text hash];
    hash = hash * 31u + self.isDone;
    hash = hash * 31u + [self.createdAt hash];
    return hash;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"__modelVersion=%d", __modelVersion];
    [description appendFormat:@", uuid=%@", self.uuid];
    [description appendFormat:@", text=%@", self.text];
    [description appendFormat:@", isDone=%@", @(self.isDone)];
    [description appendFormat:@", createdAt=%@", self.createdAt];
    [description appendString:@">"];
    return description;
}

- (id)initWithCoder:(NSCoder *)coder {
self = [super init];
    if (self) {
        _uuid = [coder decodeObjectForKey:@"_uuid"];
        _text = [coder decodeObjectForKey:@"_text"];
        _isDone = [coder decodeIntForKey:@"_isDone"];
        _createdAt = [coder decodeObjectForKey:@"_createdAt"];
        __modelVersion = [coder decodeIntForKey:@"__modelVersion"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.uuid forKey:@"_uuid"];
    [coder encodeObject:self.text forKey:@"_text"];
    [coder encodeInteger:self.isDone forKey:@"_isDone"];
    [coder encodeObject:self.createdAt forKey:@"_createdAt"];
    [coder encodeInt:__modelVersion forKey:@"__modelVersion"];
}

- (id)copyWithZone:(NSZone *)zone {
    TDAToDoItem *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy->__modelVersion = __modelVersion + 1;
        copy->_uuid = _uuid;
        copy->_text = _text;
        copy->_isDone = _isDone;
        copy->_createdAt = _createdAt;
    }

    return copy;
}


@end

@implementation TDAToDoItemBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end

