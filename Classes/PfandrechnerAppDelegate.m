//
//  pfandrechnerAppDelegate.m
//  pfandrechner
//
//  Created by Richard Metzler on 27.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import "PfandrechnerAppDelegate.h"
#import "RootViewController.h"

//// Flurry Analytics
//#import "FlurryAnalytics.h"

@implementation PfandrechnerAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize navigationController;
@synthesize navigationItem;

@synthesize player;


#pragma mark -
#pragma mark Application lifecycle

void uncaughtExceptionHandler(NSException *exception) {
//    [FlurryAnalytics logError:@"Uncaught" message:@"Crash!" exception:exception];
}


//- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//	// Analytics
////	NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
////	[FlurryAnalytics startSession:@"UGIQ3KHB88KBB5LSLHGC"];
//
//    // Display StatusBar
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    
//    // Add the navigation controller's view to the window and display.
//    [self.window addSubview:navigationController.view];
//    [self.window makeKeyAndVisible];
//
//	// mix with ipod music
//	NSError *err;
//	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&err];
//	
//	// load player and prepare to play
//	NSURL *soundURL = [NSURL fileURLWithPath: [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:@"Tock" ofType:@"aiff" ]];
//	
//	player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&err];
//	player.volume = 0.25;
//	[player prepareToPlay];
//	
//	return YES;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    // Display StatusBar
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
    
	// mix with ipod music
	NSError *err;
	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&err];
	
	// load player and prepare to play
//	NSURL *soundURL = [NSURL fileURLWithPath: [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:@"Tock" ofType:@"aiff" ]];
//	
//	player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&err];
//	player.volume = 0.25;
//	[player prepareToPlay];
	
	return YES;
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

