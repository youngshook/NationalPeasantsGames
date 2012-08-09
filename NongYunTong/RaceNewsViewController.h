//
//  RaceNewsViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-6-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsDataSource;
@interface RaceNewsViewController : UIViewController<UIScrollViewDelegate,UIWebViewDelegate>

@property(strong,nonatomic)UILabel *labelTitel;
@property(strong,nonatomic)UILabel *labelTime;
@property(strong,nonatomic)UILabel *labelSource;
@property(strong,nonatomic)UIScrollView *raceScrollView;
@property(strong,nonatomic)UIWebView *webView;
@property(strong,nonatomic)UIImageView *raceimageView;
@property(assign,nonatomic)NSUInteger indexpathrow;
@property(strong,nonatomic)NewsDataSource *newsDataSource;
@end
