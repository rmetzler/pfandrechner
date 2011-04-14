//
//  CustomCell.m
//  pfandrechner
//
//  Created by Richard Metzler on 28.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "pfandrechnerAppDelegate.h"
#import "ProductCell.h"
#import "Product.h"
#import <AudioToolbox/AudioServices.h> 
#import <AVFoundation/AVFoundation.h>

@implementation ProductCell
@synthesize nameLabel;
@synthesize imageView;
//@synthesize countLabel;
@synthesize priceLabel;
@synthesize product;
@synthesize segmentedControl;
@synthesize textView;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
    return self;
}

- (void)dealloc {
	[nameLabel	release];
	[priceLabel release];
	[imageView	release];
	//[countLabel release];
	[product	release];
	[segmentedControl release];
	[textView release];
	
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
	//countLabel.text = newVal;
	[segmentedControl setTitle:newVal forSegmentAtIndex:1];	
}

-(IBAction) incCount:(id)sender {
	[self.product incMultiplier];
	[self updateCount:sender];
	if (product.multiplier > 0) {
		[self.segmentedControl setEnabled:YES forSegmentAtIndex:0];
	}
}

-(IBAction) decCount:(id)sender {
	[self.product decMultiplier];
	[self updateCount:sender];
	if (product.multiplier == 0) {
		[self.segmentedControl setEnabled:NO forSegmentAtIndex:0];
	}
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
					  ofObject:(id)object 
						change:(NSDictionary *)change 
					   context:(void *)context
{
	[self updateCount:nil];
}

-(IBAction) segmentedControlPressed:(id) sender
{
	UISegmentedControl *control = (UISegmentedControl *) sender;
	if (0 == control.selectedSegmentIndex ) {
		[self playSound:sender];
		[self decCount:sender];
	} else {
		[self playSound:sender];
		[self incCount:sender];
	}

}

// TODO move into AppDelegate
- (IBAction) playSound:(id) sender 
{
	NSLog(@"play tock");
/*
	// load player and prepare to play
	NSError *err;
	NSURL *soundURL = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"tock" ofType:@"caf" ]];
	AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&err];
	[player prepareToPlay];
*/
	
	pfandrechnerAppDelegate *app = (pfandrechnerAppDelegate *) [[UIApplication sharedApplication] delegate];
	[app.player play];
}

@end
