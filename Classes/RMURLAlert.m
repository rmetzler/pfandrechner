//
//  RMURLAlert.m
//  Pfandrechner
//
//  Created by Richard Metzler on 25.05.11.
//  Copyright 2011 Metzler. All rights reserved.
//
//  Follow me on http://twitter.com/rmetzler
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RMURLAlert.h"

@implementation RMURLAlert


@synthesize url = _url;


- (id)initWithURL:(NSURL *) url {
    [super init];
    
    self.url = url;
    
    return self;
}

- (id)initWithURLString:(NSString *)urlString {
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (void)dealloc {
    [self.url release];
    
    [super dealloc];
}

# pragma mark -

- (void) showAlertWithMessage:(NSString *) msg
                    deferText:(NSString *) deferText
                   actionText:(NSString *) actionText {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
                                                    message:msg 
                                                   delegate:self
                                          cancelButtonTitle:deferText
                                          otherButtonTitles:actionText, Nil];
    [alert show];
    [alert release];
}


# pragma mark -
# pragma mark UIAlertDelegate

- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) index {
    if(index == 1) {
        [[UIApplication sharedApplication] openURL: self.url];
    }
}


@end


# pragma mark -

@implementation RMURLAlertIfNeverDoneYet

- (void) showAlertWithMessage:(NSString *) msg
                    deferText:(NSString *) deferText
                   actionText:(NSString *) actionText {

    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    
    if (prefs) {
        NSInteger action_count = [prefs integerForKey:kRMURLAlert_Action_Count];
        
        if (0 == action_count) {
            [super showAlertWithMessage:msg deferText:deferText actionText:actionText];
        }

    }

}

- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) index {
    if(index == 1) {
        NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
        
        if (prefs) {
            [prefs setInteger:1 forKey:kRMURLAlert_Action_Count];
            [prefs synchronize];
            [super alertView:alertView clickedButtonAtIndex:index];            
        }
    }
}


@end


# pragma mark -

@implementation RMRecurringURLAlert

@synthesize period = _period;

- (id) initWithURL:(NSURL *)url period:(NSInteger)period {
    self.period = period;
    return [super initWithURL:url];
}

- (id) initWithURLString:(NSString *)urlString period:(NSInteger)period {
    self.period = period;
    return [super initWithURLString:urlString];
}

# pragma mark -

- (void) showAlertWithMessage:(NSString *) msg 
                    deferText:(NSString *) deferText
                   actionText:(NSString *) actionText 
{
    
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    
    if (prefs) {
        
        NSInteger times_started = [prefs integerForKey:kRMURLAlert_Times_Started];

        NSLog(@"started %d times", times_started);
        
        if ((0 != times_started) && (0 == times_started % self.period)) {
            [super showAlertWithMessage:msg deferText:deferText actionText:actionText];
        }

        times_started++;
        
        [prefs setInteger:times_started forKey:kRMURLAlert_Times_Started];
        [prefs synchronize];
    
    }
}

@end
