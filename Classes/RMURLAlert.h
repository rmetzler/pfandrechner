//
//  RMURLAlert.h
//  Pfandrechner
//
//  Created by Richard Metzler on 25.05.11.
//  Copyright 2011 Metzler. All rights reserved.
//
//  Follow me on http://twitter.com/rmetzler
//

#import <Foundation/Foundation.h>


@interface RMURLAlert : NSObject<UIAlertViewDelegate> {
    NSURL* _url;
}

@property (nonatomic, copy) NSURL* url;

- (id) initWithURL: (NSURL*) url;
- (id) initWithURLString:(NSString *) urlString;

- (void) showAlertWithMessage:(NSString *) msg 
                    deferText:(NSString *) deferText
                   actionText:(NSString *) actionText;

@end



