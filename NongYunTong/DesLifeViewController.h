//
//  DesLifeViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LifeData;
@interface DesLifeViewController : UIViewController<UIScrollViewDelegate>
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UITextView *textView;
@property (strong,nonatomic)UIScrollView *scrollView;
@property (strong,nonatomic)LifeData *lifeData;
@property (strong,nonatomic)UILabel *label;

@end
