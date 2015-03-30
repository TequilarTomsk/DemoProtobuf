// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "GeneralMessage.pb.h"

@implementation GeneralMessageRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [GeneralMessageRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface GeneralMessage ()
@property GeneralMessage_MessageType msgType;
@property (retain) NSData* msgPayload;
@end

@implementation GeneralMessage

- (BOOL) hasMsgType {
  return !!hasMsgType_;
}
- (void) setHasMsgType:(BOOL) value {
  hasMsgType_ = !!value;
}
@synthesize msgType;
- (BOOL) hasMsgPayload {
  return !!hasMsgPayload_;
}
- (void) setHasMsgPayload:(BOOL) value {
  hasMsgPayload_ = !!value;
}
@synthesize msgPayload;
- (void) dealloc {
  self.msgPayload = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.msgType = GeneralMessage_MessageTypeMessageRequest;
    self.msgPayload = [NSData data];
  }
  return self;
}
static GeneralMessage* defaultGeneralMessageInstance = nil;
+ (void) initialize {
  if (self == [GeneralMessage class]) {
    defaultGeneralMessageInstance = [[GeneralMessage alloc] init];
  }
}
+ (GeneralMessage*) defaultInstance {
  return defaultGeneralMessageInstance;
}
- (GeneralMessage*) defaultInstance {
  return defaultGeneralMessageInstance;
}
- (BOOL) isInitialized {
  if (!self.hasMsgType) {
    return NO;
  }
  if (!self.hasMsgPayload) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasMsgType) {
    [output writeEnum:1 value:self.msgType];
  }
  if (self.hasMsgPayload) {
    [output writeData:2 value:self.msgPayload];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasMsgType) {
    size += computeEnumSize(1, self.msgType);
  }
  if (self.hasMsgPayload) {
    size += computeDataSize(2, self.msgPayload);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (GeneralMessage*) parseFromData:(NSData*) data {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromData:data] build];
}
+ (GeneralMessage*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (GeneralMessage*) parseFromInputStream:(NSInputStream*) input {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromInputStream:input] build];
}
+ (GeneralMessage*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeDelimitedFromInputStream:input] build];
}
+ (GeneralMessage*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (GeneralMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromCodedInputStream:input] build];
}
+ (GeneralMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (GeneralMessage*)[[[GeneralMessage builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (GeneralMessage_Builder*) builder {
  return [[[GeneralMessage_Builder alloc] init] autorelease];
}
+ (GeneralMessage_Builder*) builderWithPrototype:(GeneralMessage*) prototype {
  return [[GeneralMessage builder] mergeFrom:prototype];
}
- (GeneralMessage_Builder*) builder {
  return [GeneralMessage builder];
}
@end

BOOL GeneralMessage_MessageTypeIsValidValue(GeneralMessage_MessageType value) {
  switch (value) {
    case GeneralMessage_MessageTypeMessageRequest:
    case GeneralMessage_MessageTypeMessageReponse:
    case GeneralMessage_MessageTypeMessageUses:
      return YES;
    default:
      return NO;
  }
}
@interface GeneralMessage_Builder()
@property (retain) GeneralMessage* result;
@end

@implementation GeneralMessage_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[GeneralMessage alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (GeneralMessage_Builder*) clear {
  self.result = [[[GeneralMessage alloc] init] autorelease];
  return self;
}
- (GeneralMessage_Builder*) clone {
  return [GeneralMessage builderWithPrototype:result];
}
- (GeneralMessage*) defaultInstance {
  return [GeneralMessage defaultInstance];
}
- (GeneralMessage*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (GeneralMessage*) buildPartial {
  GeneralMessage* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (GeneralMessage_Builder*) mergeFrom:(GeneralMessage*) other {
  if (other == [GeneralMessage defaultInstance]) {
    return self;
  }
  if (other.hasMsgType) {
    [self setMsgType:other.msgType];
  }
  if (other.hasMsgPayload) {
    [self setMsgPayload:other.msgPayload];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (GeneralMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (GeneralMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 8: {
        int32_t value = [input readEnum];
        if (GeneralMessage_MessageTypeIsValidValue(value)) {
          [self setMsgType:value];
        } else {
          [unknownFields mergeVarintField:1 value:value];
        }
        break;
      }
      case 18: {
        [self setMsgPayload:[input readData]];
        break;
      }
    }
  }
}
- (BOOL) hasMsgType {
  return result.hasMsgType;
}
- (GeneralMessage_MessageType) msgType {
  return result.msgType;
}
- (GeneralMessage_Builder*) setMsgType:(GeneralMessage_MessageType) value {
  result.hasMsgType = YES;
  result.msgType = value;
  return self;
}
- (GeneralMessage_Builder*) clearMsgType {
  result.hasMsgType = NO;
  result.msgType = GeneralMessage_MessageTypeMessageRequest;
  return self;
}
- (BOOL) hasMsgPayload {
  return result.hasMsgPayload;
}
- (NSData*) msgPayload {
  return result.msgPayload;
}
- (GeneralMessage_Builder*) setMsgPayload:(NSData*) value {
  result.hasMsgPayload = YES;
  result.msgPayload = value;
  return self;
}
- (GeneralMessage_Builder*) clearMsgPayload {
  result.hasMsgPayload = NO;
  result.msgPayload = [NSData data];
  return self;
}
@end
