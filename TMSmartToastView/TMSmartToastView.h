//
//  TMSmartToastView.h
//  TMSmartToastView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMSmartToastView : UIView

typedef enum {
    TMSmartToastViewPositionTop = 1,
    TMSmartToastViewPositionCenter = 2,
    TMSmartToastViewPositionBottom = 3
} TMSmartToastViewPosition;

@property (strong, nonatomic) UILabel * messageLabel;
@property (strong, nonatomic) NSString * defaultXib;
@property NSTimeInterval duration;
@property NSInteger position;

- (TMSmartToastView *) initWithText : (NSString *) text
                            position: (TMSmartToastViewPosition) position
                             xibName: (NSString *) xibName;

- (TMSmartToastView *) initWithText : (NSString *) text
                            position: (TMSmartToastViewPosition) position
                            duration: (NSTimeInterval) duration
                             xibName: (NSString *) xibName;

- (TMSmartToastView *) initWithText : (NSString *) text
                              center: (CGPoint) center
                            duration: (NSTimeInterval) duration
                             xibName: (NSString *) xibName;

- (void) show;

- (void) dismiss;

@end
