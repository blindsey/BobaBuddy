//
//  DetailViewController.m
//  BobaBuddy
//
//  Created by Lucas on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "DetailViewController.h"
#import "ReviewCell.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSURL *imageURL = [NSURL URLWithString:self.business.imageURL];
    [self.imageView setImageWithURL:imageURL];
    
    self.phoneLabel.text = self.business.phone;
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.business.reviews count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewCell" forIndexPath:indexPath];
    
    cell.reviewLabel.text = @"Review Text";
    
    return cell;
}

@end
