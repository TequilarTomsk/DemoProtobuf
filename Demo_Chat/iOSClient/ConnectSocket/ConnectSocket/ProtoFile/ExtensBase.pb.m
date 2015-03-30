// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ExtensBase.pb.h"

@implementation ExtensBaseRoot
static id<PBExtensionField> ExtensBaseRoot_price = nil;
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ExtensBaseRoot class]) {
    ExtensBaseRoot_price =
      [[PBConcreteExtensionField extensionWithType:PBExtensionTypeString
                                     extendedClass:[BaseType class]
                                       fieldNumber:100
                                      defaultValue:@""
                               messageOrGroupClass:[NSString class]
                                        isRepeated:NO
                                          isPacked:NO
                            isMessageSetWireFormat:NO] retain];
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
  [registry addExtension:ExtensBaseRoot_price];
}
+ (id<PBExtensionField>) price {
  return ExtensBaseRoot_price;
}
@end

@interface BaseType ()
@property (retain) NSString* name;
@property int32_t quantity;
@end

@implementation BaseType

- (BOOL) hasName {
  return !!hasName_;
}
- (void) setHasName:(BOOL) value {
  hasName_ = !!value;
}
@synthesize name;
- (BOOL) hasQuantity {
  return !!hasQuantity_;
}
- (void) setHasQuantity:(BOOL) value {
  hasQuantity_ = !!value;
}
@synthesize quantity;
- (void) dealloc {
  self.name = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.name = @"";
    self.quantity = 0;
  }
  return self;
}
static BaseType* defaultBaseTypeInstance = nil;
+ (void) initialize {
  if (self == [BaseType class]) {
    defaultBaseTypeInstance = [[BaseType alloc] init];
  }
}
+ (BaseType*) defaultInstance {
  return defaultBaseTypeInstance;
}
- (BaseType*) defaultInstance {
  return defaultBaseTypeInstance;
}
- (BOOL) isInitialized {
  if (!self.hasName) {
    return NO;
  }
  if (!self.extensionsAreInitialized) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasName) {
    [output writeString:1 value:self.name];
  }
  if (self.hasQuantity) {
    [output writeUInt32:2 value:self.quantity];
  }
  [self writeExtensionsToCodedOutputStream:output
                                      from:100
                                        to:200];
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasName) {
    size += computeStringSize(1, self.name);
  }
  if (self.hasQuantity) {
    size += computeUInt32Size(2, self.quantity);
  }
  size += [self extensionsSerializedSize];
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (BaseType*) parseFromData:(NSData*) data {
  return (BaseType*)[[[BaseType builder] mergeFromData:data] build];
}
+ (BaseType*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (BaseType*)[[[BaseType builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (BaseType*) parseFromInputStream:(NSInputStream*) input {
  return (BaseType*)[[[BaseType builder] mergeFromInputStream:input] build];
}
+ (BaseType*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (BaseType*)[[[BaseType builder] mergeDelimitedFromInputStream:input] build];
}
+ (BaseType*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (BaseType*)[[[BaseType builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (BaseType*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (BaseType*)[[[BaseType builder] mergeFromCodedInputStream:input] build];
}
+ (BaseType*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (BaseType*)[[[BaseType builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (BaseType_Builder*) builder {
  return [[[BaseType_Builder alloc] init] autorelease];
}
+ (BaseType_Builder*) builderWithPrototype:(BaseType*) prototype {
  return [[BaseType builder] mergeFrom:prototype];
}
- (BaseType_Builder*) builder {
  return [BaseType builder];
}
@end

@interface BaseType_Builder()
@property (retain) BaseType* result;
@end

@implementation BaseType_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[BaseType alloc] init] autorelease];
  }
  return self;
}
- (PBExtendableMessage*) internalGetResult {
  return result;
}
- (BaseType_Builder*) clear {
  self.result = [[[BaseType alloc] init] autorelease];
  return self;
}
- (BaseType_Builder*) clone {
  return [BaseType builderWithPrototype:result];
}
- (BaseType*) defaultInstance {
  return [BaseType defaultInstance];
}
- (BaseType*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (BaseType*) buildPartial {
  BaseType* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (BaseType_Builder*) mergeFrom:(BaseType*) other {
  if (other == [BaseType defaultInstance]) {
    return self;
  }
  if (other.hasName) {
    [self setName:other.name];
  }
  if (other.hasQuantity) {
    [self setQuantity:other.quantity];
  }
  [self mergeExtensionFields:other];
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (BaseType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (BaseType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setName:[input readString]];
        break;
      }
      case 16: {
        [self setQuantity:[input readUInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasName {
  return result.hasName;
}
- (NSString*) name {
  return result.name;
}
- (BaseType_Builder*) setName:(NSString*) value {
  result.hasName = YES;
  result.name = value;
  return self;
}
- (BaseType_Builder*) clearName {
  result.hasName = NO;
  result.name = @"";
  return self;
}
- (BOOL) hasQuantity {
  return result.hasQuantity;
}
- (int32_t) quantity {
  return result.quantity;
}
- (BaseType_Builder*) setQuantity:(int32_t) value {
  result.hasQuantity = YES;
  result.quantity = value;
  return self;
}
- (BaseType_Builder*) clearQuantity {
  result.hasQuantity = NO;
  result.quantity = 0;
  return self;
}
@end
