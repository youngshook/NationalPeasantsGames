//
//  NewsDataSource.h
//  NongYunTong
//
//  Created by YoungShook on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDataSource : NSObject
@property(strong,nonatomic)NSMutableArray *arrayTitle;
@property(strong,nonatomic)NSMutableArray *arrayUrl;
@property(strong,nonatomic)NSMutableArray *publishTime;
@property(strong,nonatomic)NSMutableArray *arrayImage;
@property(strong,nonatomic)NSMutableArray *arrayTextBody;
-(void)setLoadData;
@end
