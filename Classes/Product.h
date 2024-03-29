//
//  product.h
//  pfandrechner
//
//  Created by Richard Metzler on 10.03.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Product : NSObject {
	NSNumber *product;
	
	double multiplicant;
	int multiplier;
	
	NSString *image;
	NSString *description;
}

-(Product *) initWithPrice:(double)price
					 image:(NSString *) img
			   description:(NSString *) desc;
	
@property double multiplicant;
@property int multiplier;
@property (nonatomic,retain) NSNumber *product;

@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *description;


-(void) resetMultiplier;
-(void) setMultiplierToInt:(int)multiplier;
-(void) incMultiplier;
-(void) decMultiplier;


@end
