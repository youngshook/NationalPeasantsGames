//
//  RaceItemSearchXML.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RaceItemSearchData;
@interface RaceItemSearchXML : NSObject
@property (strong,nonatomic)RaceItemSearchData *raceItemSearchData;
@property (strong,nonatomic)NSMutableArray *itemArray;
@property (strong,nonatomic)NSString *string;
-(NSMutableArray *)XML:(NSString *)itemXML;
@end
