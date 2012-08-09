    //
    //  RootViewController.h
    //  FlickTabControlDemo
    //
    //  Created by Shaun Harrison on 2/11/09.
    //  Copyright enormego 2009. All rights reserved.
    //

#import "MyFlickTabControl.h"
#import <AudioToolbox/AudioToolbox.h>
@interface RootViewController : MyFlickTableViewController {
    NSDictionary *data;
    NSMutableArray *dataAray;
    NSArray *weekArray;
    BOOL isFirstRun;
    BOOL isNight;
    BOOL isFirstClick;
    NSArray *array;
    NSArray *temparray;
    NSString *temp;
    
    
        //下面为下拉刷新
    UIView *refreshHeaderView;
    UILabel *refreshLabel;
    UILabel *refreshDate;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isDragging;
    BOOL isLoading;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
    NSString *textDate;
    
    SystemSoundID soundID;
    
    
}
-(void)parserJson;
-(void)initDateAndWeek;

    //
- (void)addPullToRefreshHeader;
- (void)startLoading;
- (void)stopLoading;
- (void)refresh;


    //
@property (nonatomic, retain) UIView *refreshHeaderView;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) UILabel *refreshDate;
@property (nonatomic, retain) UIImageView *refreshArrow;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, copy) NSString *textPull;
@property (nonatomic, copy) NSString *textRelease;
@property (nonatomic, copy) NSString *textLoading;
@property (nonatomic, copy) NSString *textDate;



@property (nonatomic, retain) NSDictionary *data;
@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) NSArray *weekArray;
@property (nonatomic, retain) NSArray *cityArray;
@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) NSArray *temparray;
@property (nonatomic, retain) NSString *temp;




@end
