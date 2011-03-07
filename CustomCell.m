//
//  CustomCell.m
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell
@synthesize nameLabel;
@synthesize priceLabel;
@synthesize imageView;
@synthesize countField;
@synthesize count;
@synthesize euros;


- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.count = 0;
    }
    return self;
}


- (void)dealloc {
	[nameLabel	release];
	[priceLabel release];
	[imageView	release];
	[countField release];
	
	[super dealloc];
}


- (void)setSelected:(BOOL)selected 
		   animated:(BOOL)animated {
    
    [super setSelected:NO 
			  animated:animated];
    
    // Configure the view for the selected state.
}


#pragma mark -
#pragma mark IBActions

-(IBAction) incCount:(id)sender {
	if (count < 1000) {
		count++;
		countField.text =  [[NSString alloc]initWithFormat:@"%d",self.count];
	}
}

-(IBAction) decCount:(id)sender {
	if (count > 0) {
		count--;
		countField.text = [[NSString alloc]initWithFormat:@"%d",self.count];
		NSDecimalNumber *dn = [[NSDecimalNumber decimalNumberWithString:@"0.08"]
							   decimalNumberByMultiplyingBy:
							   [NSDecimalNumber decimalNumberWithString:countField.text]];
		[UIApplication sharedApplication].delegate;
	}
	
	
}



@end
