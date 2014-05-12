//
//  TMViewController.m
//  TMSmartToastView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import "TMViewController.h"

@interface TMViewController ()

@end

@implementation TMViewController

TMSmartToastView * toastView;

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated
{
    
	toastView = [[TMSmartToastView alloc] initWithText:@"Testing toastview with autolayout and auto line break" position:TMSmartToastViewPositionBottom duration:2.0];
    
    [toastView show];
}
- (IBAction)dismiss:(id)sender
{
    [toastView dismiss];
}
- (IBAction)show:(id)sender
{
    [toastView show];
}

@end
