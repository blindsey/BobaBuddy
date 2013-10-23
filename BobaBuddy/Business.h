//
//  Business.h
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject

- (id)initWithDictionary:(NSDictionary *)data;

@property (strong, nonatomic, readonly) NSString *id;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *imageURL;
@property (strong, nonatomic, readonly) NSString *address;
@property (strong, nonatomic, readonly) NSString *mobileURL;
@property (strong, nonatomic, readonly) NSString *snippetText;
@property (strong, nonatomic, readonly) NSString *phone;

@property (assign, nonatomic, readonly) float distance; // in meters

@property (assign, nonatomic, readonly) float rating;
@property (strong, nonatomic, readonly) NSString *ratingImageURL; // 84x17
@property (strong, nonatomic, readonly) NSString *largeRatingImageURL; // 166x30

@property (strong, nonatomic, readonly) NSArray *reviews; // of Reviews

+ (NSArray *)businessesWithArray:(NSArray *)array;
@end
