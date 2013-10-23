//
//  ListResultCell.m
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/23/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "ListResultCell.h"
#import "UIImageView+AFNetworking.h"

@interface ListResultCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;


@end

@implementation ListResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBusiness:(Business *)business
{
    self.nameLabel.text = business.name;
    self.addressLabel.text = business.address;
    
    NSURL *url = [NSURL URLWithString:business.ratingImageURL];
    [self.ratingImageView setImageWithURL:url];
}

@end
