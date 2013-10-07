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
    self.restorationClass = [RTDetailViewController class];
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
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"DetailView decodeRestorableStateWithCoder");
    self.row = [coder decodeIntegerForKey:@"row"];
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSLog(@"DetailViewController viewControllerWithRestorationIdentifierPath %@", [identifierComponents componentsJoinedByString:@"/"]);
    if (![@"Navigation" isEqualToString:identifierComponents[0]]) {
        return nil;
    }
    NSString *lastComponent = [identifierComponents lastObject];
    UINavigationController *navigationController = (UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    if (!navigationController) {
        return nil;
    }
    for (UIViewController *viewController in navigationController.viewControllers) {
        if ([lastComponent isEqualToString:viewController.restorationIdentifier]) {
            return viewController;
        }
        
    }
    // there is no view controller in the navigation controller with our restoration ID, so we must make a new one
    
    /* Apple's example constructs this from the storyboard, but it seems that the storyboard that I get back is nil!
     https://developer.apple.com/library/ios/documentation/iphone/conceptual/iphoneosprogrammingguide/StatePreservation/StatePreservation.html#//apple_ref/doc/uid/TP40007072-CH11-SW10
     */
     
    UIStoryboard* storyboard = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (!storyboard) {
        NSLog(@"UIStateRestorationViewControllerStoryboardKey null!");
        return nil;
    }
    
    RTDetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:lastComponent];
    detailViewController.restorationIdentifier = lastComponent;
    detailViewController.restorationClass = [RTDetailViewController class];
    [navigationController pushViewController:detailViewController animated:NO];
    return detailViewController;
}


@end
