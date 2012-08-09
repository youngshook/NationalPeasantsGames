//
//  RaceCardViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshView.h"
@class NewsDataSource;

@interface RaceCardViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,RefreshViewDelegate>{

}

@property(strong,nonatomic)UITableView *raceTableView;
@property(strong,nonatomic)NewsDataSource *newsDataSource;
@property(strong,nonatomic)RefreshView *refreshView;
- (IBAction)refreshWeather:(id)sender;
@end
