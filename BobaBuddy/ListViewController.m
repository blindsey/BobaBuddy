//
//  ViewController.m
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/16/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "ListViewController.h"
#import "Business.h"
#import "ListResultCell.h"
#import "YelpClient.h"
#import "UIImageView+AFNetworking.h"

@interface ListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *indexButton;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;

@property (strong, nonatomic) NSArray *results; // of Business

- (void)refreshData;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"BobaBuddy";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"Back";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ListResultCell";
    ListResultCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    Business *business = self.results[indexPath.row];
    cell.business = business;
    [cell.indexButton setTitle:[NSString stringWithFormat:@"%d", indexPath.row + 1] forState:UIControlStateNormal];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Business *business = self.results[indexPath.row];
    self.nameLabel.text = business.name;
    [self.indexButton setTitle:[NSString stringWithFormat:@"%d", indexPath.row + 1] forState:UIControlStateNormal];

    NSURL *url = [NSURL URLWithString:business.largeRatingImageURL];
    [self.ratingImageView setImageWithURL:url];
    self.distanceLabel.text = [NSString stringWithFormat:@"%0.f meters", business.distance];
}

#pragma mark - Private methods

- (void)refreshData
{
    // TODO: use location services to get current location
    [[YelpClient instance] searchWithLatitude:37.774929 andLongitude:-122.419416 success:^(AFHTTPRequestOperation *operation, id response) {
        //NSLog(@"%@", response);
        if ([response isKindOfClass:[NSDictionary class]]) {
            id businesses = [response objectForKey:@"businesses"];
            if ([businesses isKindOfClass:[NSArray class]]) {
                self.results = [Business businessesWithArray:businesses];
                [self.tableView reloadData];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Couldn't access yelp, please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}

@end
