//
//  DetailViewController.h
//  BobaBuddy
//
//  Created by Lucas on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"

@interface DetailViewController : UIViewController <UITableViewDataSource>

@property (strong, nonatomic) Business *business;

@end
