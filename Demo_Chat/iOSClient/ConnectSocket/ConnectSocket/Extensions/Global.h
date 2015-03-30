//
//  Header.h
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

typedef void (^successCompletionHandler)(NSData * responseObject);
typedef void (^failureCompletionHandler)(NSError *error);
typedef void (^cancelCompletionHandler)(NSString * string);

#define SERVER_LINK @"http://192.168.1.204:8000"
#define REMOTEHOSTNAME @"www.apple.com"
#define IPADDRESS @"192.168.1.204"
