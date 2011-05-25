//
//  RMURLAlert.m
//  Pfandrechner
//
//  Created by Richard Metzler on 25.05.11.
//  Copyright 2011 Metzler. All rights reserved.
//
//  Follow me on http://twitter.com/rmetzler
//

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
    [self release];
}


@end
