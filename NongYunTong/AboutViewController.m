//
//  AboutViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-8-8.
//
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{

	[super viewWillAppear:animated];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [shareAppBtn setBackgroundImage:[[UIImage imageNamed:@"btn_blue"] stretchableImageWithLeftCapWidth:8 topCapHeight:15] forState:UIControlStateNormal];
    [shareAppBtn setTitle:@"分享此App给其他好友" forState:UIControlStateNormal];
    [scoringBtn setBackgroundImage:[[UIImage imageNamed:@"btn_blue"]stretchableImageWithLeftCapWidth:8 topCapHeight:15] forState:UIControlStateNormal];
    [scoringBtn setTitle:@"亲,去给此App打个分吧" forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[[UIImage imageNamed:@"btn_blue"]stretchableImageWithLeftCapWidth:8 topCapHeight:15] forState:UIControlStateNormal];
    [backBtn setTitle:@"我知道了,返回" forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)shareApp:(id)sender{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    if (messageClass != nil)
    {
            // Check whether the current device is configured for sending SMS messages
        if ([messageClass canSendText])
            {
            [self displaySMSComposerSheet];
            }
        else {
            NSLog(@"该设备无发短信功能");
            }
    }
    else
    {
    NSLog(@"您系统版本低于4.0");
    }
}


-(void)displaySMSComposerSheet{
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = self;
    picker.body=[NSString stringWithFormat:@"我给你推荐一个iPhone/iTouch/iPad上的应用《农运通》,让你把第七届农运会的一切信息了如指掌,在AppStore里搜索《农运通》即可免费下载使用~"];
    [self presentModalViewController:picker animated:YES];
    [picker release];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller                 didFinishWithResult:(MessageComposeResult)result {
    switch (result)
    {
        case MessageComposeResultCancelled:
        NSLog(@"Result: SMS sending canceled");
        break;
        case MessageComposeResultSent:
        NSLog(@"Result: SMS sent");
        break;
        case MessageComposeResultFailed:
        NSLog(@"短信发送失败!");
        break;
        default:
        NSLog(@"Result: SMS not sent");
        break;
    }
    [self dismissModalViewControllerAnimated:YES];
}



-(IBAction)scoring:(id)sender{
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=551950360"
                     ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
-(IBAction)backMain:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
