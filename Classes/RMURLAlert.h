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

#define kRMURLAlert_Times_Started @"RMURLAlert_Defer_Count"
#define kRMURLAlert_Defer_Count @"RMURLAlert_Defer_Count"
#define kRMURLAlert_Action_Count @"RMURLAlert_Action_Count"


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



@interface RMURLAlertIfNeverDoneYet : RMURLAlert {
    
}
@end



@interface RMRecurringURLAlert : RMURLAlertIfNeverDoneYet {
    NSInteger _period;
}

@property (nonatomic, assign) NSInteger period;

- (id) initWithURL: (NSURL*) url period:(NSInteger) period;
- (id) initWithURLString:(NSString *) urlString period:(NSInteger) period;

@end

