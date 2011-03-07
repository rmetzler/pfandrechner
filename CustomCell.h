//
//  CustomCell.h
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTableViewRowHeight 91

@interface CustomCell : UITableViewCell {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *priceLabel;
	IBOutlet UIImageView *imageView;
	IBOutlet UITextField *countField;
	
	IBOutlet NSDecimalNumber *euros;
	int count;
}

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UITextField *countField;
@property NSDecimalNumber *euros;
@property int count;

-(IBAction) incCount:(id)sender;
-(IBAction) decCount:(id)sender;


@end
