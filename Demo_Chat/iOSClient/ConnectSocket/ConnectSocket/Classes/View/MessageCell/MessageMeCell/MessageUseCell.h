//
//  MMessageCell.h
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageRespose.pb.h"

@interface MessageUseCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *time;
@property (nonatomic,strong) IBOutlet UILabel *message;
@property (nonatomic,strong) IBOutlet UIImageView *imgBackground;
@property (nonatomic,strong) IBOutlet UIImageView *imgAvatar;
@property (nonatomic,strong) IBOutlet UILabel *userName;
@property (nonatomic,strong) IBOutlet UIImageView *endLine;

@property (nonatomic,assign) float contentHeight;
@property (nonatomic,strong) ResponseMessage *responseMess;

@end
