    //
    //  RootViewController.m
    //  FlickTabControlDemo
    //
    //  Created by Shaun Harrison on 2/11/09.
    //  Copyright enormego 2009. All rights reserved.
    //

#import "RootViewController.h"
#import "SZJsonParser.h"
#import "WeatherCell.h"
#import <QuartzCore/QuartzCore.h>

#define REFRESH_HEADER_HEIGHT 50.0f
#define URL1(id) [NSString stringWithFormat:@"http://m.weather.com.cn/data/10118070%@.html",id]//前九个
#define URL2(id) [NSString stringWithFormat:@"http://m.weather.com.cn/data/1011807%@.html",id]//11至12
Byte n;
@implementation RootViewController
@synthesize data;
@synthesize dataArray;
@synthesize weekArray;
@synthesize cityArray;
@synthesize array;
@synthesize temparray;
@synthesize temp;

@synthesize textPull, textRelease, textLoading, textDate,refreshHeaderView, refreshLabel,refreshDate, refreshArrow, refreshSpinner;

-(id)init{
    if (self = [super init]) {
        self.tabBarItem.title = @"南阳天气";
        self.tabBarItem.image = [UIImage imageNamed:@"Fifth.png"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    isFirstRun = YES;
	isFirstClick = YES;
	self.title = @"南阳天气";
    
    self.weekArray = [NSArray arrayWithObjects:@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    [self initDateAndWeek];
    if (isFirstRun) {
        [self getNanyangWeather];
    }
    
    
    
        //下拉刷新代码    
    textPull = [[NSString alloc] initWithString:@"下拉可以刷新..."];
    textRelease = [[NSString alloc] initWithString:@"释放刷新..."];
    textLoading = [[NSString alloc] initWithString:@"正在加载..."];
    [self addPullToRefreshHeader];
    
}

#pragma mark 下拉刷新
- (void)addPullToRefreshHeader {
    refreshHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, REFRESH_HEADER_HEIGHT)];
    refreshHeaderView.backgroundColor = [UIColor clearColor];
    
    refreshLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 10/*REFRESH_HEADER_HEIGHT*/)];
    refreshLabel.backgroundColor = [UIColor clearColor];
    refreshLabel.font = [UIFont boldSystemFontOfSize:12.0];
    refreshLabel.textAlignment = UITextAlignmentCenter;
    
    refreshDate = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    refreshDate.backgroundColor = [UIColor clearColor];
    refreshDate.font = [UIFont boldSystemFontOfSize:12.0];
    refreshDate.textAlignment = UITextAlignmentCenter;
    
    
    refreshArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    refreshArrow.frame = CGRectMake((REFRESH_HEADER_HEIGHT - 27) / 2,
                                    (REFRESH_HEADER_HEIGHT - 44) / 2,
                                    27, 44);
    
    refreshSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    refreshSpinner.frame = CGRectMake((REFRESH_HEADER_HEIGHT - 20) / 2, (REFRESH_HEADER_HEIGHT - 20) / 2, 20, 20);
    refreshSpinner.hidesWhenStopped = YES;
    
    [refreshHeaderView addSubview:refreshLabel];
    [refreshHeaderView addSubview:refreshDate];
    [refreshHeaderView addSubview:refreshArrow];
    [refreshHeaderView addSubview:refreshSpinner];
    [self.tableView addSubview:refreshHeaderView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (isLoading) return;
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (isLoading) {
            // Update the content inset, good for section headers
        if (scrollView.contentOffset.y > 0)
            self.tableView.contentInset = UIEdgeInsetsZero;
        else if (scrollView.contentOffset.y >= -REFRESH_HEADER_HEIGHT)
            self.tableView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (isDragging && scrollView.contentOffset.y < 0) {
            // Update the arrow direction and label
        [UIView beginAnimations:nil context:NULL];
        if (scrollView.contentOffset.y < -REFRESH_HEADER_HEIGHT) {
                // User is scrolling above the header
            refreshLabel.text = self.textRelease;
            [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        } else { // User is scrolling somewhere within the header
            refreshLabel.text = self.textPull;
            [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
        }
        [UIView commitAnimations];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (isLoading) return;
    isDragging = NO;
    if (scrollView.contentOffset.y <= -REFRESH_HEADER_HEIGHT) {
            // Released above the header
        [self startLoading];
    }
}

- (void)startLoading {
    isLoading = YES;
    
        // Show the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.tableView.contentInset = UIEdgeInsetsMake(REFRESH_HEADER_HEIGHT, 0, 0, 0);
    refreshLabel.text = self.textLoading;
    refreshArrow.hidden = YES;
    [refreshSpinner startAnimating];
    [UIView commitAnimations];
    
        // Refresh action!
    [self refresh];
}

- (void)stopLoading {
    isLoading = NO;
    
        // Hide the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(stopLoadingComplete:finished:context:)];
    self.tableView.contentInset = UIEdgeInsetsZero;
    [refreshArrow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
    [UIView commitAnimations];
}

- (void)stopLoadingComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
        // Reset the header
    refreshLabel.text = self.textPull;
    refreshArrow.hidden = NO;
    [refreshSpinner stopAnimating];
}

- (void)refresh {
        // This is just a demo. Override this method with your custom reload action.
        // Don't forget to call stopLoading at the end.
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *outFormat = [[NSDateFormatter alloc] init];
    [outFormat setDateFormat:@"MM'-'dd HH':'mm':'ss"];
    NSString *timeStr = [outFormat stringFromDate:nowDate];
    [outFormat release];
    refreshDate.text = [NSString stringWithFormat:@"最后更新:%@",timeStr];
    
    /*NSString *me = [NSString stringWithFormat:@"%d",n];
     if (n<10) {
     NSURL *url1 = [NSURL URLWithString:URL1(me)];
     [self performSelectorInBackground:@selector(parserWeatherData:)withObject:url1];
     
     
     
     }else if(n>=10){
     NSURL *url2 = [NSURL URLWithString:URL2(me)];
     [self performSelectorInBackground:@selector(parserWeatherData:)withObject:url2];
     
     
     }*/
    [self parserJson];
    
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2.0];
}

#pragma mark 下拉完毕

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
                                     // Release anything that's not essential, such as cached data
}
#pragma marm 全局数据获取
-(void)parserJson {
    NSURL *url = [[[NSURL alloc]init]autorelease];
    if (isFirstClick) {
        n = 1;
    }
    if (n<10) {
        NSString *me = [NSString stringWithFormat:@"%d",n];
        url = [NSURL URLWithString:URL1(me)];
    }else if(n<=12) {
        NSString *me = [NSString stringWithFormat:@"%d",n];
        url = [NSURL URLWithString:URL2(me)];
    }
    NSString *sou = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];

    NSDictionary *json = [sou jsonObject];
    self.data = [json objectForKey:@"weatherinfo"];
    
    isNight = NO;
    if ([[self.data objectForKey:@"fchh"] intValue] > 12) {
        isNight = YES;
    }
    
        //NSLog(@"数据更新完毕");
    
}
    //初次加载时先取得南阳城区的数据
-(void)getNanyangWeather {
    NSURL *firstUrl = [NSURL URLWithString:@"http://m.weather.com.cn/data/101180701.html"];
    NSString *sou = [NSString stringWithContentsOfURL:firstUrl encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *json  = [sou jsonObject];
    self.data = [json objectForKey:@"weatherinfo"];
    
    isNight = NO;
    if ([[self.data objectForKey:@"fchh"] intValue] > 12) {
        isNight = YES;
    }
    
}

-(void)initDateAndWeek {
    self.dataArray = [NSMutableArray arrayWithCapacity:7];
    Byte i;
    NSCalendar *calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *coms = [[[NSDateComponents alloc]init]autorelease];
    NSDate *dateNow = [NSDate date];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit |  NSWeekdayCalendarUnit;
    for (i=0; i<7; i++) {
        NSDate *newDate = [dateNow dateByAddingTimeInterval:i*3600*24];
        coms = [calender components:unitFlags fromDate:newDate];
        [self.dataArray addObject:[NSString stringWithFormat:@"%d月%d日-%@",[coms month],[coms day],[self.weekArray objectAtIndex:[coms weekday]-1]]];
    }
    [calender release];

    self.cityArray = [NSArray arrayWithObjects:@"南阳", @"南召",@"方城",@"社旗",@"西峡",@"内乡",@"镇平",@"浙川",@"新野",@"唐河",@"邓州",@"桐柏",nil];
}
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


    // Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    }
    return 1;
    
}


    // Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    NSString *cellName = @"WeatherCell";
    if (indexPath.section == 0) {
        if (isNight == YES) {
            cellName = @"WeatherCellPM";
        }
        cell = (WeatherCell *)[tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil]lastObject];
            ((WeatherCell *)cell).delegate = self;
        }
        
        
        ((WeatherCell *)cell).dateLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        if (self.data) {
            ((WeatherCell *)cell).tempLabel.text = [self.data objectForKey:[NSString stringWithFormat:@"temp%d",indexPath.row + 1]];
            ((WeatherCell *)cell).windLabel.text = [self.data objectForKey:[NSString stringWithFormat:@"wind%d",indexPath.row + 1]];
            ((WeatherCell *)cell).weatherLabel.text = [self.data objectForKey:[NSString stringWithFormat:@"weather%d",indexPath.row + 1]];
            
            
            NSString *dayImageName = [self.data objectForKey:[NSString stringWithFormat:@"img%d",2*indexPath.row+1]];
            NSString *nightImageName = [self.data objectForKey:[NSString stringWithFormat:@"img%d",2*indexPath.row + 2]];
            ((WeatherCell *)cell).dayImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"d%@.png",dayImageName]];
            
            if ([nightImageName intValue] == 99) {
                ((WeatherCell *)cell).nightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"n%@.png",dayImageName]];
            }
            else {
                ((WeatherCell *)cell).nightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"n%@.png",nightImageName]];
            }
            ((WeatherCell *)cell).dateLabel.textColor = [UIColor orangeColor];
            ((WeatherCell *)cell).weatherLabel.textColor = [UIColor purpleColor];
            ((WeatherCell *)cell).tempLabel.textColor = [UIColor redColor];
            ((WeatherCell *)cell).windLabel.textColor = [UIColor orangeColor];
        }
    }
    else {
        static NSString *ID = @"LIHANG";
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID]autorelease];
            
        }
        cell.textLabel.text = @"为农运加油!祝农运健儿取得好成绩!";
        cell.textLabel.textColor = [UIColor brownColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [NSString stringWithFormat:@"%@发布时间:%@点",self.title,[self.data objectForKey:@"fchh"]];
    }
    return [NSString stringWithFormat:@"生活贴士:%@",[self.data objectForKey:@"index_d"]];
}

#pragma mark -
#pragma mark FlickTabView Delegate & Data Source

- (void)scrollTabView:(MyFlickTabView*)scrollTabView didSelectedTabAtIndex:(NSInteger)index {
	[self.tableView reloadData];
    isFirstClick = NO;//因为在没有点击之前n是没有值的，这时候如果下拉刷新可能获取不到数据，恰好这时候显示的是南阳，所以就把n置为1，下拉刷新取得是南阳的数据，详见parser();
    Byte i;
    i = self.flickTabView.selectedTabIndex+1;
    
    
    n = self.flickTabView.selectedTabIndex+1;
    [self parserJson];
    
    
    self.array = [NSArray arrayWithObjects:@"南阳天气", @"南召天气",@"方城天气",@"社旗天气",@"西峡天气",@"内乡天气",@"镇平天气",@"浙川天气",@"新野天气",@"唐河天气",@"邓州天气",@"桐柏天气",nil];
    switch (i) {
        case 1:
            self.title = [self.array objectAtIndex:0];
            break;
        case 2:
            self.title = [self.array objectAtIndex:1];
            break;
        case 3:
            self.title = [self.array objectAtIndex:2];
            break;
        case 4:
            self.title = [self.array objectAtIndex:3];
            break;
        case 5:
            self.title = [self.array objectAtIndex:4];
            break;
        case 6:
            self.title = [self.array objectAtIndex:5];
            break;
        case 7:
            self.title = [self.array objectAtIndex:6];
            break;
        case 8:
            self.title = [self.array objectAtIndex:7];
            break;
        case 9:
            self.title = [self.array objectAtIndex:8];
            break;
        case 10:
            self.title = [self.array objectAtIndex:9];
            break;
        case 11:
            self.title = [self.array objectAtIndex:10];
            break;
        case 12:
            self.title = [self.array objectAtIndex:11];
            break;
        default:
            break;
    }
    
    
}

- (NSInteger)numberOfTabsInScrollTabView:(MyFlickTabView*)scrollTabView {
	return 12;
}

- (NSString*)scrollTabView:(MyFlickTabView*)scrollTabView titleForTabAtIndex:(NSInteger)index {
    temparray = [NSArray arrayWithObjects:@"南阳", @"南召",@"方城",@"社旗",@"西峡",@"内乡",@"镇平",@"浙川",@"新野",@"唐河",@"邓州",@"桐柏",nil];
    
    NSInteger i;
    
    for (i=0; i<[temparray count]; i++) {
        temp =[temparray objectAtIndex:index];
    }
    return temp;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56.0f;
}

#pragma mark -


- (void)dealloc {
    [super dealloc];
    [data release];
    [dataAray release];
    [weekArray release];
    [cityArray release];
    [array release];
    [temparray release];
    [temp release];
    
    [refreshHeaderView release];
    [refreshLabel release];
    [refreshArrow release];
    [refreshSpinner release];
    [textPull release];
    [textRelease release];
    [textLoading release];
    isFirstRun = NO;
}


@end

