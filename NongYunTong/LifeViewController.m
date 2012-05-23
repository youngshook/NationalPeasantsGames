//
//  LifeViewController.m
//  NongYunTong
//
//  Created by YoungShook on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LifeViewController.h"
#import "DesLifeViewController.h"
#import "LifeData.h"
#import "LifeXML.h"
#import "TravelCell.h"
#import "TrainsCell.h"
#import "AirCell.h"
#import "BusCell.h"
@interface LifeViewController ()

@end

@implementation LifeViewController
@synthesize lifeXML,mutableArray1,mutableArray2,mutableArray3,mutableArray4,mutableArray5,mutableArray6,mutableArray7,mutableArray8;

-(id) init{
    if (self = [super init]) {
        self.tabBarItem.title = @"便利向导";
        self.tabBarItem.image = [UIImage imageNamed:@""];
        self.navigationItem.title = @"便利向导";
    }
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lifeXML = [[LifeXML alloc]init];
    mutableArray1 = [lifeXML XML:@"scenery"];
    mutableArray2 = [lifeXML XML:@"clothesing"];
    mutableArray3 = [lifeXML XML:@"winshop"];
    mutableArray4 = [lifeXML XML:@"supermarket"];
    mutableArray5 = [lifeXML XML:@"hotel"];
    mutableArray6 = [lifeXML XML:@"Trains"];
    mutableArray7 = [lifeXML XML:@"bus"];
    mutableArray8 = [lifeXML XML:@"air"];
    
        
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 50.0f)];
	label.text = @"2012南阳全国农民运动会";
	label.textAlignment = UITextAlignmentCenter;
	label.font = [UIFont boldSystemFontOfSize:14.0f];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.tableView.tableFooterView = label;
	[label release];
	
	self.title = @"便利向导";
    // Do any additional setup after loading the view from its nib.
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


    // Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.flickTabView.selectedTabIndex == 0) {
        return [mutableArray1 count];
    }
    else if (self.flickTabView.selectedTabIndex == 1) {
        return [mutableArray2 count];
    }
    else if (self.flickTabView.selectedTabIndex == 2) {
        return [mutableArray3 count];
    }
    else if (self.flickTabView.selectedTabIndex == 3) {
        return [mutableArray4 count];
    }
    else if (self.flickTabView.selectedTabIndex == 4) {
       return [mutableArray5 count];
    }
    else if (self.flickTabView.selectedTabIndex == 5) {
        return [mutableArray6 count];
    }
    else if (self.flickTabView.selectedTabIndex == 6) {
        return [mutableArray7 count];
    }
    else if (self.flickTabView.selectedTabIndex == 7) {
        return [mutableArray8 count];
    }

}


    // Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.flickTabView.selectedTabIndex == 0) {
        
        TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TravelCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        
        LifeData *data = [mutableArray1 objectAtIndex:indexPath.row];
        cell.CellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",data.Des3]];
        NSLog(@"%@",data.Des3);
        cell.CellLabel.text = data.Des2;
        cell.CellLabelDes.text = data.Des4;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (self.flickTabView.selectedTabIndex == 1) {
        
        TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TravelCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        
        LifeData *data = [mutableArray2 objectAtIndex:indexPath.row];
        cell.CellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",data.Des5]];
        cell.CellLabel.text = data.Des1;
        cell.CellLabelDes.text = data.Des3;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (self.flickTabView.selectedTabIndex == 2) {
        
        TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TravelCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        
        LifeData *data = [mutableArray3 objectAtIndex:indexPath.row];
        cell.CellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",data.Des7]];
        cell.CellLabel.text = data.Des1;
        cell.CellLabelDes.text = data.Des5;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (self.flickTabView.selectedTabIndex == 3) {
        
        TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TravelCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        
        LifeData *data = [mutableArray4 objectAtIndex:indexPath.row];
        cell.CellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",data.Des5]];
        cell.CellLabel.text = data.Des1;
        cell.CellLabelDes.text = data.Des4;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (self.flickTabView.selectedTabIndex == 4) {
        
        TravelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TravelCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        
        LifeData *data = [mutableArray5 objectAtIndex:indexPath.row];
        cell.CellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",data.Des7]];
        cell.CellLabel.text = data.Des1;
        cell.CellLabelDes.text = data.Des5;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (self.flickTabView.selectedTabIndex == 5) {
        
        TrainsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrainsCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TrainsCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        LifeData *data = [mutableArray6 objectAtIndex:indexPath.row];
        cell.label1.text = data.Des1;
        cell.label2.text = data.Des2;
        cell.label3.text = data.Des3;
        cell.label4.text = data.Des8;
        cell.label5.text = data.Des4;
        cell.label6.text = data.Des5;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
       
    }
    else if (self.flickTabView.selectedTabIndex == 6) {
        
        BusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"BusCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        LifeData *data = [mutableArray7 objectAtIndex:indexPath.row];
        cell.label1.text = data.Des2;
        cell.label2.text = data.Des4;
        cell.label3.text = data.Des7;
        cell.imageView.image = [UIImage imageNamed:@"Bus.jpg"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
        
    }
    else if (self.flickTabView.selectedTabIndex == 7) {
        
        AirCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AirCell" owner:self options:nil];  
            cell = [array objectAtIndex:0]; 
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            UIView * backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
            cell.backgroundView = backgroundView;
            [backgroundView release];
        }
        LifeData *data = [mutableArray8 objectAtIndex:indexPath.row];
        cell.label1.text = data.Des1;
        cell.label2.text = data.Des2;
        cell.label3.text = data.Des4;
        cell.label4.text = data.Des7;
        cell.label5.text = data.Des8;
        cell.label6.text = data.Des5;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.flickTabView.selectedTabIndex == 0) {
        LifeData *data = [mutableArray1 objectAtIndex:indexPath.row];
        DesLifeViewController *desLifeViewController = [[DesLifeViewController alloc]init];
        desLifeViewController.label.text = data.Des2;
        desLifeViewController.textView.text = data.Des4;
        desLifeViewController.imageView.image = [UIImage imageNamed:data.Des3];
        [self.navigationController pushViewController:desLifeViewController animated:YES];
    }
    else if (self.flickTabView.selectedTabIndex == 1) {
        LifeData *data = [mutableArray2 objectAtIndex:indexPath.row];
        DesLifeViewController *desLifeViewController = [[DesLifeViewController alloc]init];
        desLifeViewController.label.text = data.Des1;
        desLifeViewController.textView.text = data.Des3;
        desLifeViewController.imageView.image = [UIImage imageNamed:data.Des5];
        [self.navigationController pushViewController:desLifeViewController animated:YES];

    }
    else if (self.flickTabView.selectedTabIndex == 2) {
        LifeData *data = [mutableArray3 objectAtIndex:indexPath.row];
        DesLifeViewController *desLifeViewController = [[DesLifeViewController alloc]init];
        desLifeViewController.label.text = data.Des1;
        desLifeViewController.textView.text = data.Des5;
        desLifeViewController.imageView.image = [UIImage imageNamed:data.Des7];
        [self.navigationController pushViewController:desLifeViewController animated:YES];

    }
    else if (self.flickTabView.selectedTabIndex == 3) {
        LifeData *data = [mutableArray4 objectAtIndex:indexPath.row];
        DesLifeViewController *desLifeViewController = [[DesLifeViewController alloc]init];
        desLifeViewController.label.text = data.Des1;
        desLifeViewController.textView.text = data.Des3;
        desLifeViewController.imageView.image = [UIImage imageNamed:data.Des5];
        [self.navigationController pushViewController:desLifeViewController animated:YES];
    }
    else if (self.flickTabView.selectedTabIndex == 4) {
        LifeData *data = [mutableArray5 objectAtIndex:indexPath.row];
        DesLifeViewController *desLifeViewController = [[DesLifeViewController alloc]init];
        desLifeViewController.label.text = data.Des1;
        desLifeViewController.textView.text = data.Des5;
        desLifeViewController.imageView.image = [UIImage imageNamed:data.Des7];
        [self.navigationController pushViewController:desLifeViewController animated:YES];

    }
    else if (self.flickTabView.selectedTabIndex == 5) {
        
    }
    else if (self.flickTabView.selectedTabIndex == 6) {
       

    }
    else if (self.flickTabView.selectedTabIndex == 7) {
        
    }

}


#pragma mark -
#pragma mark FlickTabView Delegate & Data Source

- (void)scrollTabView:(FlickTabView*)scrollTabView didSelectedTabAtIndex:(NSInteger)index {
	[self.tableView reloadData];
}

- (NSInteger)numberOfTabsInScrollTabView:(FlickTabView*)scrollTabView {
    
	return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}



- (NSString*)scrollTabView:(FlickTabView*)scrollTabView titleForTabAtIndex:(NSInteger)index {
   NSMutableArray  *titleArray = [[NSMutableArray alloc]initWithObjects:@"旅游",@"购物",@"酒店",@"超市",@"宾馆",@"火车",@"汽车",@"飞机", nil];
    NSString *title = [titleArray objectAtIndex:index];

	return title;
}


#pragma mark -


- (void)dealloc {
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
