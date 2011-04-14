//
//  pfandrechnerAppDelegate.m
//  pfandrechner
//
//  Created by Richard Metzler on 27.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "pfandrechnerAppDelegate.h"
#import "RootViewController.h"

// Flurry Analytics
#import "FlurryAPI.h"

@implementation pfandrechnerAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize navigationItem;

@synthesize player;


#pragma mark -
#pragma mark Application lifecycle

void uncaughtExceptionHandler(NSException *exception) {
    [FlurryAPI logError:@"Uncaught" message:@"Crash!" exception:exception];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Analytics
	NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
//	[FlurryAPI startSession:@"UGIQ3KHB88KBB5LSLHGC"];

    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

	// load player and prepare to play
	NSError *err;
	NSURL *soundURL = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"tock" ofType:@"caf" ]];
	
	player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&err];
	//[player prepareToPlay];
	
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[player release];
	[navigationController release];
	[navigationItem release];	 
	[window release];
	
	[super dealloc];
}


@end

