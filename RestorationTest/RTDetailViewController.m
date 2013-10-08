//
//  RTViewController.m
//  RestorationTest
//
//  Created by Aneel Nazareth on 10/7/13.
//  Copyright (c) 2013 Aneel Nazareth. All rights reserved.
//

#import "RTDetailViewController.h"

@interface RTDetailViewController ()

@end

@implementation RTDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.rowLabel.text = [NSString stringWithFormat:@"%ld", (long) self.row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"DetailView encodeRestorableStateWithCoder");
    [coder encodeInteger:self.row forKey:@"row"];
    [super encodeRestorableStateWithCoder:coder];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"DetailView decodeRestorableStateWithCoder");
    [super decodeRestorableStateWithCoder:coder];
    self.row = [coder decodeIntegerForKey:@"row"];
}


@end
