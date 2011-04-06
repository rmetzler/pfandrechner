//
//  product.m
//  pfandrechner
//
//  Created by Richard Metzler on 10.03.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "Product.h"


@implementation Product
@synthesize multiplier;
@synthesize multiplicant;
@synthesize product;

@synthesize image;
@synthesize description;

-(Product *) initWithPrice:(double) price
					 image:(NSString *) img
			   description:(NSString *) desc {
	
	self = [super init];
	self.multiplier = 0;
	self.multiplicant = price;
	
	self.product = [NSNumber numberWithDouble:multiplier*multiplicant];
	
	self.image = img;
	self.description = desc;
	
	return self;
}

/*
-(NSNumber *) product {
	return [NSNumber numberWithDouble:multiplier*multiplicant];
}
*/

-(void) resetMultiplier {
	self.multiplier = 0;
	
	self.product = [NSNumber numberWithDouble:multiplier*multiplicant];
}

-(void) incMultiplier {
	if (multiplier < 999) {
		multiplier += 1;
	}
	
	self.product = [NSNumber numberWithDouble:multiplier*multiplicant];
}

-(void) decMultiplier {
	if (multiplier > 0) {
		multiplier -= 1;
	}
	
	self.product = [NSNumber numberWithDouble:multiplier*multiplicant];
}

@end
