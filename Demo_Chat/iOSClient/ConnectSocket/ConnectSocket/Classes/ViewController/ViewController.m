//
//  ViewController.m
//  ConnectSocket
//
//  Created by framgiavn on 1/8/15.
//  Copyright (c) 2015 framgiavn. All rights reserved.
//

#import "ViewController.h"
#import "SRWebSocket.h"
#import "MessageMeCell.h"
#import "MessageUseCell.h"
#import "RequestServer.h"

//____Proto Import
#import "GeneralMessage.pb.h"
#import "MessageRequest.pb.h"
#import "MessageRespose.pb.h"
#import "UsersMessage.pb.h"

//____Check Internet
#import "Reachability.h"

//____Ping Internet
#import "SimplePingHelper.h"


#define CurrentUser @"User 1"
#define CurrentUserID 1
#define BASE_HEIGHT_CELL 92.0f

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    SRWebSocket *_webSocket;
    
    IBOutlet UITableView *tblMessage;
    IBOutlet UITextView *txtMessage;
    IBOutlet UIButton *btnSend;
    IBOutlet UIView *bottomView;
    
    
    NSMutableArray *arrayChat;
    NSMutableArray *_arrHeight;
    
    NSTimer *_ping;

}

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    txtMessage.layer.borderWidth = 1.0;
    txtMessage.layer.cornerRadius = 5.0;
    txtMessage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    btnSend.layer.cornerRadius = 5.0;
    
    
    arrayChat = [[NSMutableArray alloc] init];
    _arrHeight = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTap)];
    [tblMessage addGestureRecognizer:tap];
    
    [self connectToServer];
    
    //___________Check internet
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReachability = [Reachability reachabilityWithHostName:REMOTEHOSTNAME];
	[self.hostReachability startNotifier];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

-(void)connectToServer
{
    [[RequestServer create] connectWithSuccess:^(NSData *responseObject) {
        NSLog(@"Connect Success!");
        
        UsersMessage *useMess = [[[[UsersMessage builder] setUserId:1] setUserName:@"Le Si Hoang"] build];
        GeneralMessage *generalMess = [[[[GeneralMessage builder] setMsgType:3] setMsgPayload:[useMess data]] build];
        
        [[RequestServer create] sendWithData:[generalMess data] withSuccess:^(NSData *responseObject) {
            //Not User
        } fail:^(NSError *error) {
            //Not User
        } cancel:^(NSString *string) {
            //Not User
        }];
        
    } fail:^(NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    } cancel:^(NSString *string) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }];
}

#pragma mark - Check Connect internet

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	[self updateInterfaceWithReachability:curReach];
}

-(void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    switch (netStatus)
    {
        case NotReachable:{
            if (!_ping) {
                [self pingNow];
                _ping = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pingNow) userInfo:nil repeats:YES];
            }
        
        }
            break;
        default:
            break;
    }
}

#pragma mark-Ping Current Network
-(void)pingNow
{
    [SimplePingHelper ping:IPADDRESS target:self sel:@selector(pingResult:)];
}
- (void)pingResult:(NSNumber*)success
{
    if (success.boolValue) {
        [self connectToServer];
        [_ping invalidate];
        _ping = nil;
        
        NSLog(@"Connect internet!");
        
    }else {
        
        NSLog(@"Not connect internet!");
    }
}


#pragma mark - Keyboard Action

-(void)keyboardWillShow
{
    bottomView.frame = CGRectMake(bottomView.frame.origin.x, bottomView.frame.origin.y-210, bottomView.frame.size.width, bottomView.frame.size.height);
    tblMessage.frame = CGRectMake(tblMessage.frame.origin.x, tblMessage.frame.origin.y, tblMessage.frame.size.width, tblMessage.frame.size.height-210);
}

-(void)keyboardWillHide
{
    bottomView.frame = CGRectMake(bottomView.frame.origin.x, bottomView.frame.origin.y+210, bottomView.frame.size.width, bottomView.frame.size.height);
    tblMessage.frame = CGRectMake(tblMessage.frame.origin.x, tblMessage.frame.origin.y, tblMessage.frame.size.width, tblMessage.frame.size.height+210);
}

-(void)tableViewTap
{
    [self.view endEditing:YES];
}

-(IBAction)sendMessage:(id)sender
{
    if (txtMessage.text.length == 0) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Empty text" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
        return;
    }
    NSString *text = txtMessage.text;
    txtMessage.text = @"";
    
    UIImage *img = [UIImage imageNamed:@"avatar1.png"];
    NSData *data = UIImagePNGRepresentation(img);
    
    RequestMessage_PersionReceipt *perReceipt = [[[[[RequestMessage_PersionReceipt builder] setUserId:2] setUserName:@"User 2"] setUserAvatar:data] build];
    
    RequestMessage_PersionSend *perSend = [[[[[RequestMessage_PersionSend builder] setUserId:1] setUserName:@"User 1"] setUserAvatar:data] build];
    
    RequestMessage *messageSend = [[[[[RequestMessage builder] setContent:text] setPerReceipt:perReceipt] setPerSend:perSend] build];
    
    
    GeneralMessage *generalMess = [[[[GeneralMessage builder] setMsgType:1] setMsgPayload:[messageSend data]] build];
    
    [[RequestServer create] sendWithData:[generalMess data] withSuccess:^(NSData *responseObject) {
        
        // Block will be involked when receive mesage
        
        GeneralMessage *genMessage = [GeneralMessage parseFromData:responseObject];
        
        switch (genMessage.msgType) {
            case 1:
            {
                [MessageResposeRoot initialize];
                PBExtensionRegistry *exRegis = [MessageResposeRoot extensionRegistry];
                
                ResponseMessage *resMess = [ResponseMessage parseFromData:genMessage.msgPayload extensionRegistry:exRegis];
                [arrayChat addObject:resMess];
                
                CGSize contentMess = [resMess.content.content sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]
                                                         constrainedToSize:CGSizeMake(235, 1000)
                                                             lineBreakMode:UILineBreakModeCharacterWrap];
                [_arrHeight addObject:[NSNumber numberWithFloat:ceilf(contentMess.height)]];
                
                [tblMessage reloadData];
                
                [tblMessage scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:arrayChat.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            }
                break;
                
            default:
                break;
        }
        
        
    } fail:^(NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
    } cancel:^(NSString *string) {
        
        [[[UIAlertView alloc] initWithTitle:@"Message" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayChat.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = [[_arrHeight objectAtIndex:indexPath.row] floatValue];
    height = height < 22 ? BASE_HEIGHT_CELL : BASE_HEIGHT_CELL+ height;
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ResponseMessage *messItem = [arrayChat objectAtIndex:indexPath.row];
    PersionReceive *perReceive = [messItem getExtension:[PersionReceive persionReceive]];
    
    float height = [[_arrHeight objectAtIndex:indexPath.row] floatValue];
    
    if (perReceive.userId != CurrentUserID) {
        MessageMeCell *cell = (MessageMeCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageMeCell"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageMeCell" owner:self options:nil] firstObject];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentHeight = height;
        [cell setResponseMess:messItem];
        
        if (indexPath.row == (arrayChat.count - 1)) {
            cell.endLine.hidden = YES;
        }
        
        return cell;
        
    }else {
        MessageUseCell *cell = (MessageUseCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageUseCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageUseCell" owner:self options:nil] firstObject];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentHeight = height;
        [cell setResponseMess:messItem];
        
        if (indexPath.row == (arrayChat.count - 1)) {
            cell.endLine.hidden = YES;
        }
        
        return cell;
    }
    
    return nil;
    
}


-(NSString *)getCurrentTime
{
    NSDateFormatter *dataFormat = [[NSDateFormatter alloc] init];
    [dataFormat setDateFormat:@"HH:mm - dd/MM/YYYY"];
    NSString *currentTime = [dataFormat stringFromDate:[NSDate date]];
    return currentTime;
}


@end
