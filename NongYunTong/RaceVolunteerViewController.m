//
//  RaceVolunteerViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-8-8.
//
//

#import "RaceVolunteerViewController.h"

@interface RaceVolunteerViewController ()

@end

@implementation RaceVolunteerViewController


- (id)initWithURLString:(NSString*)aurl {

    self = [super init];
    if (self) {
        url=[aurl copy];
    }
    return self;
}
-(void)loadURL:(NSURL*)aurl{

	[web loadRequest:[NSURLRequest requestWithURL:aurl]];
}

- (void)didReceiveMemoryWarning
{

        // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{

    [super viewDidLoad];
	
    self.title = @"第七届农运会简介";
	CGRect f=self.view.bounds;
	f.size.height-=44;
	
	web=[[UIWebView alloc] initWithFrame:f];
	web.backgroundColor=[UIColor clearColor];
	
	web.scalesPageToFit=YES;
	web.delegate=self;
	if (url) {
		
		if ([url hasPrefix:@"http"]) {
			[self loadURL:[NSURL URLWithString:url]];
		}else {
			[self loadURL:[NSURL fileURLWithPath:url]];
		}
	}
	[self.view insertSubview:[web autorelease] atIndex:0];
	
}

-(void)webViewDidStartLoad:(UIWebView *)webView{

	waitV=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	waitV.center=self.view.center;
	[waitV startAnimating];
	[self.view addSubview:[waitV autorelease]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

	[waitV removeFromSuperview];
	waitV=nil;
	
	[self.view.window makeKeyAndVisible];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

	[waitV removeFromSuperview];
	waitV=nil;
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    /** 修复用户在加载完成之前返回崩溃的问题*/
    web.delegate=nil;
}

- (void)dealloc {

    [url release];
	url=nil;
    [super dealloc];
}
@end