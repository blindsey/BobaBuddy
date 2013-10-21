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

- (void)authorizeWithCallbackUrl:(NSURL *)callbackUrl success:(void (^)(AFOAuth1Token *accessToken, id responseObject))success failure:(void (^)(NSError *error))failure;

- (void)searchWithLatitude:(float)latitude andLongitude:(float)longitude success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)businessWithId:(NSString *)id success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
