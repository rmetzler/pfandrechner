//
//  CustomCell.m
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "PfandrechnerAppDelegate.h"
#import "ProductCell.h"
#import "Product.h"
#import <AudioToolbox/AudioServices.h> 
#import <AVFoundation/AVFoundation.h>

@implementation ProductCell
@synthesize nameLabel;
@synthesize countLabel;
@synthesize plusButton;
@synthesize minusButton;
@synthesize imageView;
@synthesize priceLabel;
@synthesize product;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
    return self;
}

- (void)dealloc {
	[nameLabel	release];
	[priceLabel release];
	[imageView	release];
    [plusButton release];
    [minusButton release];
	[countLabel release];
	[product	release];

	
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

-(IBAction) updateCount:(id)sender 
{
	NSString *newVal = [[[NSString alloc]initWithFormat:@"%d", self.product.multiplier] autorelease];
	countLabel.text = newVal;
}

-(IBAction) incCount:(id)sender {
	[self.product incMultiplier];
	[self updateCount:sender];
    [[UIDevice currentDevice] playInputClick];
}

-(IBAction) decCount:(id)sender {
	[self.product decMultiplier];
	[self updateCount:sender];
    [[UIDevice currentDevice] playInputClick];
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
					  ofObject:(id)object 
						change:(NSDictionary *)change 
					   context:(void *)context
{
	[self updateCount:nil];
}

- (BOOL)enableInputClicksWhenVisible {
    return YES;
}


@end
