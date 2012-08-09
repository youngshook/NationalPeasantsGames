//
//  WeatherCell.h
//  GeiniableClock
//
//  Created by yuan jun on 11-8-29.
//  Copyright 2011 the9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@interface WeatherCell : UITableViewCell {
	
	RootViewController *delegate;
	
	UILabel *dateLabel;
	UILabel *tempLabel;
	UILabel *windLabel;
	UILabel *weatherLabel;
	UIImageView *dayImageView;
	UIImageView *nightImageView;
		
}

@property (nonatomic, assign) RootViewController *delegate;

@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *tempLabel;
@property (nonatomic, retain) IBOutlet UILabel *windLabel;
@property (nonatomic, retain) IBOutlet UILabel *weatherLabel;
@property (nonatomic, retain) IBOutlet UIImageView *dayImageView;
@property (nonatomic, retain) IBOutlet UIImageView *nightImageView;

@end
