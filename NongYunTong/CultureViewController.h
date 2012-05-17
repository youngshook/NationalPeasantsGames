//
//  CultureViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PeopleXML;
@interface CultureViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
   
}
@property (strong,nonatomic) UITableView *CultureTableView;
@property (strong,nonatomic) PeopleXML *peopleXml;
-(void)SetObject:(id)sender;
@end
