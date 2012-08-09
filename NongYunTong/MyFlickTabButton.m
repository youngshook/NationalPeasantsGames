//
//  flickTabButton.m
//  Enormego Frameworks
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "MyFlickTabButton.h"

//#define unselectedColor [UIColor colorWithRed:90/255.0f green:86/255.0f blue:102/255.0f alpha:1.0f]
#define unselectedColor [UIColor colorWithRed:0.1 green:0.1 blue:1.0 alpha:1.0f]
//#define unselectedShadowColor [UIColor colorWithWhite:0.6f alpha:0.5f]
#define unselectedShadowColor  [UIColor colorWithRed:0.1 green:0.1 blue:1.0 alpha:1.0]
#define selectedColor [UIColor whiteColor]

@implementation MyFlickTabButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, -1.0f, frame.size.width, frame.size.height)];
		imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		imageView.backgroundColor = [UIColor clearColor];
		imageView.image = [[UIImage imageNamed:@"flick-tab-over1.png"] stretchableImageWithLeftCapWidth:11.0f topCapHeight:0.0f];
		imageView.hidden = YES;
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, -1.0f, frame.size.width, frame.size.height)];
		label.textAlignment = UITextAlignmentCenter;
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:16.0f];
		label.textColor = unselectedColor;
		label.shadowColor = unselectedShadowColor;
		label.shadowOffset = CGSizeMake(0.0f,-1.0f);
		
		[self addSubview:imageView];
		[self addSubview:label];
		
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)setText:(NSString*)text {
	label.text = text;
}

- (void)markSelected {
	label.textColor = selectedColor;
    label.shadowColor = unselectedColor;
	imageView.hidden = NO;
	self.selected = YES;
}

- (void)markUnselected {
	label.textColor = unselectedColor;
	label.shadowColor = unselectedShadowColor;
	imageView.hidden = YES;
	self.selected = NO;
}

- (NSString*)text {
	return label.text;
}

- (UIFont*)font {
	return label.font;
}

- (void)dealloc {
	[label release];
    [super dealloc];
}


@end
