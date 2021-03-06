// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Repeats.pb.h"

@implementation RepeatsRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [RepeatsRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Repeat ()
@property (retain) NSString* title;
@property (retain) NSMutableArray* mutableEntryList;
@end

@implementation Repeat

- (BOOL) hasTitle {
  return !!hasTitle_;
}
- (void) setHasTitle:(BOOL) value {
  hasTitle_ = !!value;
}
@synthesize title;
@synthesize mutableEntryList;
- (void) dealloc {
  self.title = nil;
  self.mutableEntryList = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.title = @"";
  }
  return self;
}
static Repeat* defaultRepeatInstance = nil;
+ (void) initialize {
  if (self == [Repeat class]) {
    defaultRepeatInstance = [[Repeat alloc] init];
  }
}
+ (Repeat*) defaultInstance {
  return defaultRepeatInstance;
}
- (Repeat*) defaultInstance {
  return defaultRepeatInstance;
}
- (NSArray*) entryList {
  return mutableEntryList;
}
- (Repeat_Entry*) entryAtIndex:(int32_t) index {
  id value = [mutableEntryList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasTitle) {
    [output writeString:1 value:self.title];
  }
  for (Repeat_Entry* element in self.entryList) {
    [output writeMessage:2 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasTitle) {
    size += computeStringSize(1, self.title);
  }
  for (Repeat_Entry* element in self.entryList) {
    size += computeMessageSize(2, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Repeat*) parseFromData:(NSData*) data {
  return (Repeat*)[[[Repeat builder] mergeFromData:data] build];
}
+ (Repeat*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat*)[[[Repeat builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Repeat*) parseFromInputStream:(NSInputStream*) input {
  return (Repeat*)[[[Repeat builder] mergeFromInputStream:input] build];
}
+ (Repeat*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (Repeat*)[[[Repeat builder] mergeDelimitedFromInputStream:input] build];
}
+ (Repeat*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat*)[[[Repeat builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Repeat*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Repeat*)[[[Repeat builder] mergeFromCodedInputStream:input] build];
}
+ (Repeat*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat*)[[[Repeat builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Repeat_Builder*) builder {
  return [[[Repeat_Builder alloc] init] autorelease];
}
+ (Repeat_Builder*) builderWithPrototype:(Repeat*) prototype {
  return [[Repeat builder] mergeFrom:prototype];
}
- (Repeat_Builder*) builder {
  return [Repeat builder];
}
@end

@interface Repeat_Entry ()
@property (retain) NSString* title;
@end

@implementation Repeat_Entry

- (BOOL) hasTitle {
  return !!hasTitle_;
}
- (void) setHasTitle:(BOOL) value {
  hasTitle_ = !!value;
}
@synthesize title;
- (void) dealloc {
  self.title = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.title = @"";
  }
  return self;
}
static Repeat_Entry* defaultRepeat_EntryInstance = nil;
+ (void) initialize {
  if (self == [Repeat_Entry class]) {
    defaultRepeat_EntryInstance = [[Repeat_Entry alloc] init];
  }
}
+ (Repeat_Entry*) defaultInstance {
  return defaultRepeat_EntryInstance;
}
- (Repeat_Entry*) defaultInstance {
  return defaultRepeat_EntryInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasTitle) {
    [output writeString:1 value:self.title];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasTitle) {
    size += computeStringSize(1, self.title);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Repeat_Entry*) parseFromData:(NSData*) data {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromData:data] build];
}
+ (Repeat_Entry*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Repeat_Entry*) parseFromInputStream:(NSInputStream*) input {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromInputStream:input] build];
}
+ (Repeat_Entry*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeDelimitedFromInputStream:input] build];
}
+ (Repeat_Entry*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Repeat_Entry*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromCodedInputStream:input] build];
}
+ (Repeat_Entry*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Repeat_Entry*)[[[Repeat_Entry builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Repeat_Entry_Builder*) builder {
  return [[[Repeat_Entry_Builder alloc] init] autorelease];
}
+ (Repeat_Entry_Builder*) builderWithPrototype:(Repeat_Entry*) prototype {
  return [[Repeat_Entry builder] mergeFrom:prototype];
}
- (Repeat_Entry_Builder*) builder {
  return [Repeat_Entry builder];
}
@end

@interface Repeat_Entry_Builder()
@property (retain) Repeat_Entry* result;
@end

@implementation Repeat_Entry_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Repeat_Entry alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Repeat_Entry_Builder*) clear {
  self.result = [[[Repeat_Entry alloc] init] autorelease];
  return self;
}
- (Repeat_Entry_Builder*) clone {
  return [Repeat_Entry builderWithPrototype:result];
}
- (Repeat_Entry*) defaultInstance {
  return [Repeat_Entry defaultInstance];
}
- (Repeat_Entry*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Repeat_Entry*) buildPartial {
  Repeat_Entry* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Repeat_Entry_Builder*) mergeFrom:(Repeat_Entry*) other {
  if (other == [Repeat_Entry defaultInstance]) {
    return self;
  }
  if (other.hasTitle) {
    [self setTitle:other.title];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Repeat_Entry_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Repeat_Entry_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setTitle:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasTitle {
  return result.hasTitle;
}
- (NSString*) title {
  return result.title;
}
- (Repeat_Entry_Builder*) setTitle:(NSString*) value {
  result.hasTitle = YES;
  result.title = value;
  return self;
}
- (Repeat_Entry_Builder*) clearTitle {
  result.hasTitle = NO;
  result.title = @"";
  return self;
}
@end

@interface Repeat_Builder()
@property (retain) Repeat* result;
@end

@implementation Repeat_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Repeat alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Repeat_Builder*) clear {
  self.result = [[[Repeat alloc] init] autorelease];
  return self;
}
- (Repeat_Builder*) clone {
  return [Repeat builderWithPrototype:result];
}
- (Repeat*) defaultInstance {
  return [Repeat defaultInstance];
}
- (Repeat*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Repeat*) buildPartial {
  Repeat* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Repeat_Builder*) mergeFrom:(Repeat*) other {
  if (other == [Repeat defaultInstance]) {
    return self;
  }
  if (other.hasTitle) {
    [self setTitle:other.title];
  }
  if (other.mutableEntryList.count > 0) {
    if (result.mutableEntryList == nil) {
      result.mutableEntryList = [NSMutableArray array];
    }
    [result.mutableEntryList addObjectsFromArray:other.mutableEntryList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Repeat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Repeat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setTitle:[input readString]];
        break;
      }
      case 18: {
        Repeat_Entry_Builder* subBuilder = [Repeat_Entry builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addEntry:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasTitle {
  return result.hasTitle;
}
- (NSString*) title {
  return result.title;
}
- (Repeat_Builder*) setTitle:(NSString*) value {
  result.hasTitle = YES;
  result.title = value;
  return self;
}
- (Repeat_Builder*) clearTitle {
  result.hasTitle = NO;
  result.title = @"";
  return self;
}
- (NSArray*) entryList {
  if (result.mutableEntryList == nil) { return [NSArray array]; }
  return result.mutableEntryList;
}
- (Repeat_Entry*) entryAtIndex:(int32_t) index {
  return [result entryAtIndex:index];
}
- (Repeat_Builder*) replaceEntryAtIndex:(int32_t) index with:(Repeat_Entry*) value {
  [result.mutableEntryList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (Repeat_Builder*) addAllEntry:(NSArray*) values {
  if (result.mutableEntryList == nil) {
    result.mutableEntryList = [NSMutableArray array];
  }
  [result.mutableEntryList addObjectsFromArray:values];
  return self;
}
- (Repeat_Builder*) clearEntryList {
  result.mutableEntryList = nil;
  return self;
}
- (Repeat_Builder*) addEntry:(Repeat_Entry*) value {
  if (result.mutableEntryList == nil) {
    result.mutableEntryList = [NSMutableArray array];
  }
  [result.mutableEntryList addObject:value];
  return self;
}
@end

