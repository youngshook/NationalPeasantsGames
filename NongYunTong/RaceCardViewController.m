    //
    //  RaceCardViewController.m
    //  NongYunTong
    //
    //  Created by YoungShook on 12-5-18.
    //  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
    //

#import "RaceCardViewController.h"
#import "RaceNewsViewController.h"
#import "SimpleAudioEngine.h"
#import "TFHpple.h"
#import "NewsDataSource.h"

@interface RaceCardViewController (private)
-(void)refresh;
-(void)stopLoading;
-(void)startLoading;
@end


@implementation RaceCardViewController

@synthesize raceTableView,refreshView,newsDataSource;

-(id) init{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    if (self = [super init]) {
        self.navigationItem.title = @"农运赛程新闻";
    }
    return self;
}

- (void)viewDidLoad
{
  
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [super viewDidLoad];
    newsDataSource = [[NewsDataSource alloc]init];
    [newsDataSource setLoadData];
   
    
    raceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 370) style:UITableViewStylePlain];
    raceTableView.delegate = self;
    raceTableView.dataSource = self;
    [self.view addSubview:raceTableView];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    label.text = @"2012南阳全国农民运动会";
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:14.0f];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.raceTableView.tableFooterView = label;
    [label release];
    
    NSArray *nils = [[NSBundle mainBundle]loadNibNamed:@"RefreshView" owner:self options:nil];
    self.refreshView = [nils objectAtIndex:0];
    [refreshView setupWithOwner:raceTableView delegate:self];
    [self firstfresh];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [raceTableView reloadData];
}


- (void)viewDidUnload
{
    [self setRefreshView:nil];
    [super viewDidUnload];
    
        // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark TableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    return 20;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    static NSString *CustomCellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [newsDataSource.arrayTitle objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [newsDataSource.arrayTextBody objectAtIndex:indexPath.row];
    if (![[newsDataSource.arrayImage objectAtIndex:indexPath.row] isEqualToString:@"null"]) {
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[newsDataSource.arrayImage objectAtIndex:indexPath.row]]]];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RaceNewsViewController *newsInfoViewController = [[RaceNewsViewController alloc]init];
    newsInfoViewController.indexpathrow = indexPath.row;
    newsInfoViewController.newsDataSource = self.newsDataSource;
    [self.navigationController pushViewController:newsInfoViewController animated:YES];
    [newsInfoViewController release];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    return 62.0f;
}

-(void)stopLoading{
    NSLog(@"Executive Method: %s",__FUNCTION__);

    [refreshView stopLoading];
}
-(void)startLoading{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [refreshView startLoading];
    [[SimpleAudioEngine sharedEngine]playEffect:@"refresh.mp3"];
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:3];
}
-(void)refresh{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [self startLoading];
}

-(void)firstfresh{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [refreshView startLoading];
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:3];
}

#pragma mark - UIScrollView
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [refreshView scrollViewWillBeginDragging:scrollView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [refreshView scrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [refreshView scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}


#pragma mark - 
#pragma RefreshViewDelegate
-(void)refreshViewDidCallBack{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [self refresh];
}

-(void)dealloc{
    NSLog(@"Executive Method: %s",__FUNCTION__);
    [raceTableView release];
    [newsDataSource release];
    [refreshView release];
    [super dealloc];
}

@end
