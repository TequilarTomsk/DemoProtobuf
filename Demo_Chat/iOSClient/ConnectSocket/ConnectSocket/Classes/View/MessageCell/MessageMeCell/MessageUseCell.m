//
//  MMessageCell.m
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

#import "MessageUseCell.h"

@implementation MessageUseCell
@synthesize time;
@synthesize message;
@synthesize imgBackground;
@synthesize imgAvatar;
@synthesize responseMess = _responseMess;
@synthesize contentHeight;
@synthesize endLine;

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithRed:102/255. green:211/255. blue:221/255. alpha:1.0];
    
    CALayer *layerImg = self.imgAvatar.layer;
    layerImg.cornerRadius = self.imgAvatar.frame.size.height/2;
    layerImg.borderWidth = 1.0;
    layerImg.borderColor = [[UIColor whiteColor] CGColor];
    [layerImg setMasksToBounds:YES];
    
    self.imgBackground.layer.cornerRadius = 3;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setResponseMess:(ResponseMessage *)responseMess
{
    PersionReceive *per = [responseMess getExtension:[PersionReceive persionReceive]];
    
    self.userName.text = per.userName;
    self.time.text = responseMess.content.timeCreate;
    self.message.text = responseMess.content.content;
    self.imgAvatar.image = [[UIImage alloc] initWithData:per.userAvatar];
    
    if (self.contentHeight > 21) {
        self.message.frame = CGRectMake(self.message.frame.origin.x, self.message.frame.origin.y, self.message.frame.size.width, self.message.frame.size.height + self.contentHeight);
        
        self.imgBackground.frame = CGRectMake(self.imgBackground.frame.origin.x, self.imgBackground.frame.origin.y, self.imgBackground.frame.size.width, self.imgBackground.frame.size.height + self.contentHeight);
        
        self.endLine.frame = CGRectMake(self.endLine.frame.origin.x, self.endLine.frame.origin.y + self.contentHeight, self.endLine.frame.size.width, 0.5);
    }
}

@end
