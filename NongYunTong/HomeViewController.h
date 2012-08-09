//
//  HomeViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagePhotosDataSource.h"
#import "PagePhotosView.h"
@interface HomeViewController : UIViewController<PagePhotosDataSource,UITableViewDataSource,UITableViewDelegate>{

}
@property(strong,nonatomic)UITableView *homeTableView;
@property(strong,nonatomic)NSMutableArray *mutableArrayTitle;
@property(strong,nonatomic)NSMutableArray *mutableArrayImage;
@end
