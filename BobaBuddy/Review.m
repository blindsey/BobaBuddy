//
//  Review.m
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "Review.h"

@implementation Review

- (id)initWithDictionary:(NSDictionary *)data
{
    self = [self init];
    if (self) {
        int time = [[data objectForKey:@"time_created"] integerValue];
        _timeCreated = [NSDate dateWithTimeIntervalSince1970:time];
        _rating = [[data objectForKey:@"rating"] floatValue];
        _excerpt = [data objectForKey:@"excerpt"];
        _ratingImageURL = [data objectForKey:@"ratingImageURL"];
        _userId = [data valueForKeyPath:@"user.id"];
        _userName = [data valueForKeyPath:@"user.name"];
        _userImageURL = [data valueForKeyPath:@"user.image_url"];
    }
    return self;
}

+ (NSArray *)reviewsWithArray:(NSArray *)array
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        Review *review = [[Review alloc] initWithDictionary:dict];
        [result addObject:review];
    }
    return result;
}

@end
