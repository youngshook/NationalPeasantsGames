//
//  RaceNewsViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-6-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RaceNewsViewController.h"
#import "NewsDataSource.h"
@interface RaceNewsViewController ()

@end

@implementation RaceNewsViewController
@synthesize labelTime,labelTitel,labelSource,raceimageView,raceScrollView,webView,indexpathrow,newsDataSource;

-(id)init{
    if (self = [super init]) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    raceScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    raceScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    raceScrollView.showsVerticalScrollIndicator = YES;
    raceScrollView.showsHorizontalScrollIndicator = NO;
    raceScrollView.delegate = self;
    raceScrollView.pagingEnabled = NO;
    
  
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,70,320,480)];
    self.webView.delegate = self;
    [webView loadHTMLString:[newsDataSource.arrayTextBody objectAtIndex:indexpathrow] baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    CGSize newSize = CGSizeMake(CGRectGetWidth(raceScrollView.bounds), CGRectGetHeight(raceScrollView.bounds)+100.0f);
    [raceScrollView setContentSize:newSize];
    

    raceimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 65, 320, 2)];
    raceimageView.image = [UIImage imageNamed:@"x1.png"];
    
    labelTime = [[UILabel alloc]initWithFrame:CGRectMake(45, 40, 160, 20)];
    labelTime.font = [UIFont fontWithName:@"Arial" size:10.0f];
    labelTime.text = [newsDataSource.publishTime objectAtIndex:indexpathrow];
    labelSource = [[UILabel alloc]initWithFrame:CGRectMake(180, 42, 100, 15)];
    labelSource.text = @"文章来源:南阳日报";
    labelSource.font = [UIFont fontWithName:@"Arial" size:10.0f];
    
    labelTitel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 25)];
    labelTitel.font = [UIFont fontWithName:@"Courier-Bold" size:18.0f];
    labelTitel.textAlignment = UITextAlignmentCenter;
    labelTitel.text = [newsDataSource.arrayTitle objectAtIndex:indexpathrow];
    
    [self.view  addSubview:raceScrollView];
    [raceScrollView addSubview:webView];
    [raceScrollView addSubview:raceimageView];
    [raceScrollView addSubview:labelTime];
    [raceScrollView addSubview:labelTitel];
    [raceScrollView addSubview:labelSource];
	// Do any additional setup after loading the view.
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    raceimageView = nil;
    raceScrollView = nil;
    webView = nil;
    labelTime = nil;
    labelTitel = nil;
    labelSource = nil;
    newsDataSource = nil;

    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [newsDataSource release];
    [webView release];
    [raceScrollView release];
    [raceimageView release];
    [labelTitel release];
    [labelTime release];
    [labelSource release];
    [super dealloc];
}

@end
