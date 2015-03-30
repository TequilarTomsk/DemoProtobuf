// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class RequestMessage;
@class RequestMessage_Builder;
@class RequestMessage_PersionReceipt;
@class RequestMessage_PersionReceipt_Builder;
@class RequestMessage_PersionSend;
@class RequestMessage_PersionSend_Builder;

@interface MessageRequestRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface RequestMessage : PBGeneratedMessage {
@private
  BOOL hasContent_:1;
  BOOL hasPerReceipt_:1;
  BOOL hasPerSend_:1;
  NSString* content;
  RequestMessage_PersionReceipt* perReceipt;
  RequestMessage_PersionSend* perSend;
}
- (BOOL) hasContent;
- (BOOL) hasPerReceipt;
- (BOOL) hasPerSend;
@property (readonly, retain) NSString* content;
@property (readonly, retain) RequestMessage_PersionReceipt* perReceipt;
@property (readonly, retain) RequestMessage_PersionSend* perSend;

+ (RequestMessage*) defaultInstance;
- (RequestMessage*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (RequestMessage_Builder*) builder;
+ (RequestMessage_Builder*) builder;
+ (RequestMessage_Builder*) builderWithPrototype:(RequestMessage*) prototype;

+ (RequestMessage*) parseFromData:(NSData*) data;
+ (RequestMessage*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage*) parseFromInputStream:(NSInputStream*) input;
+ (RequestMessage*) parseDelimitedFromInputStream:(NSInputStream*) input;
+ (RequestMessage*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (RequestMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface RequestMessage_PersionReceipt : PBGeneratedMessage {
@private
  BOOL hasUserId_:1;
  BOOL hasUserName_:1;
  BOOL hasUserAvatar_:1;
  int32_t userId;
  NSString* userName;
  NSData* userAvatar;
}
- (BOOL) hasUserId;
- (BOOL) hasUserName;
- (BOOL) hasUserAvatar;
@property (readonly) int32_t userId;
@property (readonly, retain) NSString* userName;
@property (readonly, retain) NSData* userAvatar;

+ (RequestMessage_PersionReceipt*) defaultInstance;
- (RequestMessage_PersionReceipt*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (RequestMessage_PersionReceipt_Builder*) builder;
+ (RequestMessage_PersionReceipt_Builder*) builder;
+ (RequestMessage_PersionReceipt_Builder*) builderWithPrototype:(RequestMessage_PersionReceipt*) prototype;

+ (RequestMessage_PersionReceipt*) parseFromData:(NSData*) data;
+ (RequestMessage_PersionReceipt*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage_PersionReceipt*) parseFromInputStream:(NSInputStream*) input;
+ (RequestMessage_PersionReceipt*) parseDelimitedFromInputStream:(NSInputStream*) input;
+ (RequestMessage_PersionReceipt*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage_PersionReceipt*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (RequestMessage_PersionReceipt*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface RequestMessage_PersionReceipt_Builder : PBGeneratedMessage_Builder {
@private
  RequestMessage_PersionReceipt* result;
}

- (RequestMessage_PersionReceipt*) defaultInstance;

- (RequestMessage_PersionReceipt_Builder*) clear;
- (RequestMessage_PersionReceipt_Builder*) clone;

- (RequestMessage_PersionReceipt*) build;
- (RequestMessage_PersionReceipt*) buildPartial;

- (RequestMessage_PersionReceipt_Builder*) mergeFrom:(RequestMessage_PersionReceipt*) other;
- (RequestMessage_PersionReceipt_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (RequestMessage_PersionReceipt_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUserId;
- (int32_t) userId;
- (RequestMessage_PersionReceipt_Builder*) setUserId:(int32_t) value;
- (RequestMessage_PersionReceipt_Builder*) clearUserId;

- (BOOL) hasUserName;
- (NSString*) userName;
- (RequestMessage_PersionReceipt_Builder*) setUserName:(NSString*) value;
- (RequestMessage_PersionReceipt_Builder*) clearUserName;

- (BOOL) hasUserAvatar;
- (NSData*) userAvatar;
- (RequestMessage_PersionReceipt_Builder*) setUserAvatar:(NSData*) value;
- (RequestMessage_PersionReceipt_Builder*) clearUserAvatar;
@end

@interface RequestMessage_PersionSend : PBGeneratedMessage {
@private
  BOOL hasUserId_:1;
  BOOL hasUserName_:1;
  BOOL hasUserAvatar_:1;
  int32_t userId;
  NSString* userName;
  NSData* userAvatar;
}
- (BOOL) hasUserId;
- (BOOL) hasUserName;
- (BOOL) hasUserAvatar;
@property (readonly) int32_t userId;
@property (readonly, retain) NSString* userName;
@property (readonly, retain) NSData* userAvatar;

+ (RequestMessage_PersionSend*) defaultInstance;
- (RequestMessage_PersionSend*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (RequestMessage_PersionSend_Builder*) builder;
+ (RequestMessage_PersionSend_Builder*) builder;
+ (RequestMessage_PersionSend_Builder*) builderWithPrototype:(RequestMessage_PersionSend*) prototype;

+ (RequestMessage_PersionSend*) parseFromData:(NSData*) data;
+ (RequestMessage_PersionSend*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage_PersionSend*) parseFromInputStream:(NSInputStream*) input;
+ (RequestMessage_PersionSend*) parseDelimitedFromInputStream:(NSInputStream*) input;
+ (RequestMessage_PersionSend*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (RequestMessage_PersionSend*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (RequestMessage_PersionSend*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface RequestMessage_PersionSend_Builder : PBGeneratedMessage_Builder {
@private
  RequestMessage_PersionSend* result;
}

- (RequestMessage_PersionSend*) defaultInstance;

- (RequestMessage_PersionSend_Builder*) clear;
- (RequestMessage_PersionSend_Builder*) clone;

- (RequestMessage_PersionSend*) build;
- (RequestMessage_PersionSend*) buildPartial;

- (RequestMessage_PersionSend_Builder*) mergeFrom:(RequestMessage_PersionSend*) other;
- (RequestMessage_PersionSend_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (RequestMessage_PersionSend_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUserId;
- (int32_t) userId;
- (RequestMessage_PersionSend_Builder*) setUserId:(int32_t) value;
- (RequestMessage_PersionSend_Builder*) clearUserId;

- (BOOL) hasUserName;
- (NSString*) userName;
- (RequestMessage_PersionSend_Builder*) setUserName:(NSString*) value;
- (RequestMessage_PersionSend_Builder*) clearUserName;

- (BOOL) hasUserAvatar;
- (NSData*) userAvatar;
- (RequestMessage_PersionSend_Builder*) setUserAvatar:(NSData*) value;
- (RequestMessage_PersionSend_Builder*) clearUserAvatar;
@end

@interface RequestMessage_Builder : PBGeneratedMessage_Builder {
@private
  RequestMessage* result;
}

- (RequestMessage*) defaultInstance;

- (RequestMessage_Builder*) clear;
- (RequestMessage_Builder*) clone;

- (RequestMessage*) build;
- (RequestMessage*) buildPartial;

- (RequestMessage_Builder*) mergeFrom:(RequestMessage*) other;
- (RequestMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (RequestMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasContent;
- (NSString*) content;
- (RequestMessage_Builder*) setContent:(NSString*) value;
- (RequestMessage_Builder*) clearContent;

- (BOOL) hasPerReceipt;
- (RequestMessage_PersionReceipt*) perReceipt;
- (RequestMessage_Builder*) setPerReceipt:(RequestMessage_PersionReceipt*) value;
- (RequestMessage_Builder*) setPerReceiptBuilder:(RequestMessage_PersionReceipt_Builder*) builderForValue;
- (RequestMessage_Builder*) mergePerReceipt:(RequestMessage_PersionReceipt*) value;
- (RequestMessage_Builder*) clearPerReceipt;

- (BOOL) hasPerSend;
- (RequestMessage_PersionSend*) perSend;
- (RequestMessage_Builder*) setPerSend:(RequestMessage_PersionSend*) value;
- (RequestMessage_Builder*) setPerSendBuilder:(RequestMessage_PersionSend_Builder*) builderForValue;
- (RequestMessage_Builder*) mergePerSend:(RequestMessage_PersionSend*) value;
- (RequestMessage_Builder*) clearPerSend;
@end
