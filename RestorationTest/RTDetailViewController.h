//
//  RTViewController.h
//  RestorationTest
//
//  Created by Aneel Nazareth on 10/7/13.
//  Copyright (c) 2013 Aneel Nazareth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTDetailViewController : UIViewController

@property (nonatomic) NSInteger row;

@property (weak, nonatomic) IBOutlet UILabel *rowLabel;

@end
