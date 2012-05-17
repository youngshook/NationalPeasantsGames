//
//  TopCultureViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PeopleXML;
@interface TopCultureViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
}
@property (strong,nonatomic)UITableView *topTableView;
@property (strong,nonatomic)NSMutableArray *mutableArray;
@property (strong,nonatomic)PeopleXML *peopleXml;
@property (strong,nonatomic)NSMutableArray *XmlFileNameArray;
@end
