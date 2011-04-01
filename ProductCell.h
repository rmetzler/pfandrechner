//
//  CustomCell.h
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

#define kTableViewRowHeight 91

@interface ProductCell : UITableViewCell {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *priceLabel;
	IBOutlet UIImageView *imageView;
	//IBOutlet UITextField *countField;
	//IBOutlet UILabel *countLabel;
	IBOutlet UISegmentedControl *segmentedControl;
	IBOutlet UITextView *textView;
	
	Product *product;
}

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UIImageView *imageView;
//@property (nonatomic, retain) UITextField *countField;
//@property (nonatomic, retain) UILabel *countLabel;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, retain) Product *product;

-(IBAction) incCount:	(id)sender;
-(IBAction) decCount:	(id)sender;
-(IBAction) segmentedControlPressed:(id) sender;
-(IBAction) updateCount:(id)sender;

@end
