//
//  RequestServer.h
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"
#import "SRWebSocket.h"

@interface RequestServer : NSObject<SRWebSocketDelegate>

+(RequestServer *)create;

-(void)connectWithSuccess:(successCompletionHandler)success fail:(failureCompletionHandler)fail cancel:(cancelCompletionHandler)cancel;

-(void)sendWithData:(NSData *)data withSuccess:(successCompletionHandler)success fail:(failureCompletionHandler)fail cancel:(cancelCompletionHandler)cancel;
@end
