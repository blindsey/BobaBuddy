//
//  Review.h
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

- (id)initWithDictionary:(NSDictionary *)data;

@property (strong, nonatomic, readonly) NSDate *timeCreated;

@property (assign, nonatomic, readonly) float rating;

@property (strong, nonatomic, readonly) NSString *excerpt;
@property (strong, nonatomic, readonly) NSString *ratingImageURL; // 84x17

@property (strong, nonatomic, readonly) NSString *userId;
@property (strong, nonatomic, readonly) NSString *userName;
@property (strong, nonatomic, readonly) NSString *userImageURL;

+ (NSArray *)reviewsWithArray:(NSArray *)array;

@end
