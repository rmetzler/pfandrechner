//
//  CustomCell.h
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

#define kTableViewRowHeight 88

@interface ProductCell : UITableViewCell {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *priceLabel;
	IBOutlet UIImageView *imageView;
    IBOutlet UILabel *countLabel;
	IBOutlet UIButton *minusButton;
	IBOutlet UIButton *plusButton;
	
	Product *product;
}

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *countLabel;
@property (nonatomic, retain) UIButton *minusButton;
@property (nonatomic, retain) UIButton *plusButton;
@property (nonatomic, retain) Product *product;

-(IBAction) incCount:	(id)sender;
-(IBAction) decCount:	(id)sender;
-(IBAction) updateCount:(id)sender;

@end
