//
//  RacePlaceXML.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RacePlaceData;
@interface RacePlaceXML : NSObject
@property (strong,nonatomic)RacePlaceData *racePlaceData;
@property (strong,nonatomic) NSMutableArray *mutArray;
@property (strong,nonatomic)NSString *string;
-(NSMutableArray *)XML;
@end
