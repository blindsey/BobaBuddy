//
//  YelpClient.h
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "AFOAuth1Client.h"

@interface YelpClient : AFOAuth1Client

+ (YelpClient *)instance;

- (void)searchWithLatitude:(float)latitude andLongitude:(float)longitude success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)businessWithId:(NSString *)id success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
