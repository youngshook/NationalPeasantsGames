//
//  VolunteerXML.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VolunteerData;
@interface VolunteerXML : NSObject
@property (strong,nonatomic) NSMutableArray *mutArray;
@property (strong,nonatomic) VolunteerData *volunteerData;
-(NSMutableArray *)XML;
@end
