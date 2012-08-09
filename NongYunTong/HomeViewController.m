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
#import "HomeCell.h"
#import "AboutViewController.h"
#define kSCNavBarImageTag 10
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize homeTableView,mutableArrayTitle,mutableArrayImage;

-(id)init
{
    if (self == [super init]) {
        // Custom initialization
        self.tabBarItem.title = @"农运首页";
        self.tabBarItem.image = [UIImage imageNamed:@"First.png"];
            // UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12.png"]];
            //imageView.frame = CGRectMake(0, 0, 50, 50);
            //self.navigationItem.titleView = imageView;
        self.navigationItem.title = @"农运首页";
    }
    return self;
}

-(void)GotoSettings{
    AboutViewController *aboutView = [[AboutViewController alloc]init];
    [self presentModalViewController:aboutView animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"button_main2.png"];
    [button setBackgroundImage:image
                      forState:UIControlStateNormal];
    [button addTarget:self action:@selector(GotoSettings)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(265, 22, image.size.width, image.size.height);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = menuButton;
    
    [button release];
    [menuButton release];
    
    
    mutableArrayTitle = [[NSMutableArray alloc]initWithObjects:@"农运实时新闻",@"农运比赛场地",@"农运赛程查询",@"第七届农运会简介",nil];
    mutableArrayImage = [[NSMutableArray alloc]initWithObjects:@"card.png",@"place.png",@"item.png",@"volunteer.jpg",nil];
    
    
    homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 370) style:UITableViewStylePlain];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    label.text = @"2012南阳全国农民运动会";
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:14.0f];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.homeTableView.tableFooterView = label;
    [label release];
    
    PagePhotosView *pagePhotosView = [[PagePhotosView alloc] initWithFrame: CGRectMake(0, 0,320,130) withDataSource: self];
    pagePhotosView.userInteractionEnabled = NO;
    self.homeTableView.tableHeaderView = pagePhotosView;
    [pagePhotosView release];    
    
    [self.view addSubview:homeTableView];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;

    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
        { 
                //if iOS 5.0 and later 
            [navBar setBackgroundImage:[UIImage imageNamed:@"navigationBarBackgroundRetro.png"] forBarMetrics:UIBarMetricsDefault];
        } 
    else 
        { 
            UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavBarImageTag];
            if (imageView == nil) 
                { 
                    imageView = [[UIImageView alloc] initWithImage: 
                                 [UIImage imageNamed:@"navigationBarBackgroundRetro.png"]];
                    [imageView setTag:kSCNavBarImageTag]; 
                    [navBar insertSubview:imageView atIndex:0];
                    [imageView release]; 
                } 
        } 
    // Do any additional setup after loading the view from its nib.
}

    // 有多少页
    //
- (int)numberOfPages {
	return 8;
}

    // 每页的图片
    //
- (UIImage *)imageAtIndex:(int)index {
	NSString *imageName = [NSString stringWithFormat:@"%d.jpg", index + 1];
	return [UIImage imageNamed:imageName];
}

-(void)viewWillAppear:(BOOL)animated{
    [homeTableView reloadData];
}

#pragma mark UITableView Delegete methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mutableArrayTitle count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCellIdentifier = @"Cell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.titleLabel.text = [mutableArrayTitle objectAtIndex:indexPath.row];
    cell.homeImageView.image = [UIImage imageNamed:[mutableArrayImage objectAtIndex:indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        RaceCardViewController *raceCardViewController = [[RaceCardViewController alloc]init];
        [self.navigationController pushViewController:raceCardViewController animated:YES];
        [raceCardViewController release];
    }
    else if (indexPath.row == 1) {
        RacePlaceViewController *racePlaceViewController = [[RacePlaceViewController alloc]init];
        [self.navigationController pushViewController:racePlaceViewController animated:YES];
        [racePlaceViewController release];
    }
    else if (indexPath.row == 2) {
        RaceItemViewController *raceItemViewController = [[RaceItemViewController alloc]init];
        [self.navigationController pushViewController:raceItemViewController animated:YES];
        [raceItemViewController release];
    }
    else {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"about" ofType:@"html"];
        RaceVolunteerViewController *raceVolunteerViewController = [[RaceVolunteerViewController alloc]initWithURLString:path];
        [self.navigationController pushViewController:raceVolunteerViewController animated:YES];
        [raceVolunteerViewController release];
        
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0f;
}

- (void)viewDidUnload
{
    homeTableView = nil;
    mutableArrayImage = nil;
    mutableArrayTitle = nil;
    
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)dealloc{
    [homeTableView release];
    [mutableArrayImage release];
    [mutableArrayTitle release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
