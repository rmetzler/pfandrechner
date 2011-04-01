//
//  pfandrechnerAppDelegate.h
//  pfandrechner
//
//  Created by Richard Metzler on 27.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pfandrechnerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	IBOutlet UINavigationItem *navigationItem;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;

@end

