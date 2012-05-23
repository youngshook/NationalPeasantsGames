//
//  PlaceTableCell.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceTableCell : UITableViewCell{
    IBOutlet UIImageView *CellImage;
    IBOutlet UILabel *CellText;
    IBOutlet UILabel *CellTextDes;
    
}
@property (strong,nonatomic)IBOutlet UIImageView *CellImage;
@property (strong,nonatomic)IBOutlet UILabel *CellText;
@property (strong,nonatomic)IBOutlet UILabel *CellTextDes;
@end
