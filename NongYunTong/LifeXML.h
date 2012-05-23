//
//  LifeXML.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LifeData;
@interface LifeXML : NSObject
@property (strong,nonatomic) LifeData *lifeData;
@property (strong,nonatomic)NSMutableArray *mutableArray;
-(NSMutableArray *)XML:(NSString *)itemXML;
@end
