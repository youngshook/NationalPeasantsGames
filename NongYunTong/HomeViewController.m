//
//  HomeViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "RaceCardViewController.h"
#import "RaceItemViewController.h"
#import "RacePlaceViewController.h"
#import "RaceVolunteerViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface HomeViewController ()

@end

@implementation HomeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"农运首页";
        self.tabBarItem.image = [UIImage imageNamed:@""];
            // UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12.png"]];
            //imageView.frame = CGRectMake(0, 0, 50, 50);
            //self.navigationItem.titleView = imageView;
        self.navigationItem.title = @"农运首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)RaceCard:(id)sender{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    RaceCardViewController *raceCardViewController = [[RaceCardViewController alloc]init];
    [self.navigationController pushViewController:raceCardViewController animated:YES];
    [raceCardViewController release];
}
-(IBAction)RaceItem:(id)sender{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    RaceItemViewController *raceItemViewController = [[RaceItemViewController alloc]init];
    [self.navigationController pushViewController:raceItemViewController animated:YES];
    [raceItemViewController release];
}
-(IBAction)RaceVolunteer:(id)sender{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    RaceVolunteerViewController *raceVolunteerViewController = [[RaceVolunteerViewController alloc]init];
    [self.navigationController pushViewController:raceVolunteerViewController animated:YES];
    [raceVolunteerViewController release];
}
-(IBAction)RacePlace:(id)sender{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    RacePlaceViewController *racePlaceViewController = [[RacePlaceViewController alloc]init];
    [self.navigationController pushViewController:racePlaceViewController animated:YES];
    [racePlaceViewController release];
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
