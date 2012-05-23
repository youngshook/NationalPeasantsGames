//
//  RaceVolunteerViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VolunteerXML;
@interface RaceVolunteerViewController : UITableViewController

@property(strong,nonatomic)NSMutableArray *retractableControllers;
@property(strong,nonatomic)VolunteerXML *volunteerXML;
@property(strong,nonatomic)NSMutableArray *dataArray;
@end
