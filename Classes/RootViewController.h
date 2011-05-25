//
//  RootViewController.h
//  pfandrechner
//
//  Created by Richard Metzler on 27.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMURLAlert.h"

@interface RootViewController : UITableViewController {
	NSArray *array;
    RMRecurringURLAlert* urlAlert;
}

@property (nonatomic,retain) RMURLAlert* urlAlert;

- (IBAction) reset:(id)sender;

@end
