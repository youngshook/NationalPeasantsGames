//
//  PlaceInfoViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RacePlaceData.h"
@interface PlaceInfoViewController : UIViewController<UIScrollViewDelegate>
@property (strong,nonatomic)RacePlaceData *racePlaceData;
@property (strong,nonatomic)UITextView *textView;
@property (strong,nonatomic)UIScrollView *scrollView;
@property (strong,nonatomic)UIImageView *imageView;
@end
