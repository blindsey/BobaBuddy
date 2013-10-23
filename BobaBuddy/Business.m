//
//  Business.m
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "Business.h"
#import "Review.h"

@implementation Business

- (id)initWithDictionary:(NSDictionary *)data
{
    self = [self init];
    if (self) {
        _id = [data objectForKey:@"id"];
        _name = [data objectForKey:@"name"];
        _imageURL = [data objectForKey:@"image_url"];
        _mobileURL = [data objectForKey:@"mobile_url"];
        _snippetText = [data objectForKey:@"snippet_text"];
        _phone = [data objectForKey:@"display_phone"];
        _distance = [[data objectForKey:@"distance"] floatValue];
        _rating = [[data objectForKey:@"rating"] floatValue];
        _ratingImageURL = [data objectForKey:@"rating_img_url"];
        _largeRatingImageURL = [data objectForKey:@"rating_img_url_large"];
        _reviews = [Review reviewsWithArray:[data objectForKey:@"reviews"]];

        NSArray *addresses = [data valueForKeyPath:@"location.display_address"];
        _address = addresses[0];
    }
    return self;
}

+ (NSArray *)businessesWithArray:(NSArray *)array
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        Business *business = [[Business alloc] initWithDictionary:dict];
        [result addObject:business];
    }
    return result;
}

@end
