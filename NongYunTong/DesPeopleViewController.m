//
//  DesPeopleViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DesPeopleViewController.h"
#import "PeopleData.h"

@interface DesPeopleViewController ()

@end

@implementation DesPeopleViewController

@synthesize imageView,textView,scrollView,peopleData;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:scrollView];
    textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, 320, 480)];
    textView.text = peopleData.s_Source;
    [scrollView addSubview:textView];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 0, 240, 200)];
    imageView.image = [UIImage imageNamed:peopleData.s_Image];
    [scrollView addSubview:imageView];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
