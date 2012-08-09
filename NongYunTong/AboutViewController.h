//
//  AboutViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-8-8.
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 
@interface AboutViewController : UIViewController<MFMessageComposeViewControllerDelegate>{
    IBOutlet UIButton *shareAppBtn;
    IBOutlet UIButton *scoringBtn;
    IBOutlet UIButton *backBtn;
}
-(IBAction)shareApp:(id)sender;
-(IBAction)scoring:(id)sender;
-(IBAction)backMain:(id)sender;
@end
