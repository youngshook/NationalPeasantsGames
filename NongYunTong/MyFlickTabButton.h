//
//  flickTabButton.h
//  flickTabControl
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyFlickTabButton : UIControl {
@private
	UILabel* label;
	UIImageView* imageView;
}

- (void)markSelected;
- (void)markUnselected;	

@property(nonatomic,copy) NSString* text;
@property(readonly) UIFont* font;
@end
