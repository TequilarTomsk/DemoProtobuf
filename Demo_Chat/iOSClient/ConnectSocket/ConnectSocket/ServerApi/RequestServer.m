//
//  RequestServer.m
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

#import "RequestServer.h"

static RequestServer *_request;
@implementation RequestServer
{
    
    SRWebSocket *_webSocket;
    
    successCompletionHandler _success;
    failureCompletionHandler _fail;
    cancelCompletionHandler _cancel;
    
    successCompletionHandler _connectSuccess;
    failureCompletionHandler _connectFail;
    cancelCompletionHandler _connectCancel;
    
    BOOL isServerOpen;
    
}
+(RequestServer *)create
{
    if (!_request) {
        _request = [[RequestServer alloc] init];
    }
    return _request;
}

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

//____________Connect to server
-(void)connectWithSuccess:(successCompletionHandler)success fail:(failureCompletionHandler)fail cancel:(cancelCompletionHandler)cancel
{
    _connectSuccess = success;
    _connectFail = fail;
    _connectCancel = cancel;
    NSURL *url = [NSURL URLWithString:SERVER_LINK];
    _webSocket = [[SRWebSocket alloc] initWithURL:url];
    _webSocket.delegate = self;
    [_webSocket open];
}


//____________Send Data To Server
-(void)sendWithData:(NSData *)data withSuccess:(successCompletionHandler)success fail:(failureCompletionHandler)fail cancel:(cancelCompletionHandler)cancel
{
    _success = success;
    _fail = fail;
    _cancel = cancel;
    
    [_webSocket send:data];
}

# pragma mark - WebSocket Delegate Methods

- (void) webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    _success(message);
    
}

- (void) webSocketDidOpen:(SRWebSocket *)webSocket
{
    isServerOpen = YES;
    _connectSuccess([NSData data]);
}

- (void) webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    if (_fail) {
        _fail(error);
    }else {
        _connectFail(error);
    }
}

- (void) webSocket:(SRWebSocket *)webSocket
  didCloseWithCode:(NSInteger)code
            reason:(NSString *)reason
          wasClean:(BOOL)wasClean
{
    isServerOpen = NO;
    if (_cancel) {
        _cancel(@"Socket Closed!");
    }else {
        _connectCancel(@"Socket Closed!");
    }
}
@end
