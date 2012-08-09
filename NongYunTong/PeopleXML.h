//
//  PeopleXML.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleXML : NSObject

@property (strong,nonatomic) NSMutableArray *mutArray;
@property (strong,nonatomic)NSString *string;
-(void)XML:(NSString *)XmlFileName;
@end
