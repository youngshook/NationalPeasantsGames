//
//  RaceVolunteerViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-8-8.
//
//

#import <UIKit/UIKit.h>

@interface RaceVolunteerViewController : UIViewController<UIWebViewDelegate>{
	UIWebView *web;
	NSString *url;
	
	UIActivityIndicatorView *waitV;
}

- (id)initWithURLString:(NSString*)aurl;
-(void)loadURL:(NSURL*)aurl;
@end
