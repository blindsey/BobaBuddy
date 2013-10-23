//
//  ListResultCell.h
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/23/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "business.h"

@interface ListResultCell : UITableViewCell

@property (strong, nonatomic) Business *business;

@property (weak, nonatomic) IBOutlet UIButton *indexButton;

@end
