//
//  YelpClient.m
//  BobaBuddy
//
//  Created by Ben Lindsey on 10/21/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "YelpClient.h"
#import "AFNetworking.h"

#define YELP_BASE_URL [NSURL URLWithString:@"http://api.yelp.com/"]

#define YELP_CONSUMER_KEY @"yBEqbJ68vTplgYPpDDBedQ"
#define YELP_CONSUMER_SECRET @"A6GktRq4VjWVshMgQtUYu2GpkJc"
#define YELP_TOKEN @"W45l17dkD4lpgFstqTc4ysB33akbbbfY"
#define YELP_TOKEN_SECRET @"r3xqK0R2nY0haCehlozr6qq2SRM"

@implementation YelpClient

+ (YelpClient *)instance
{
    static dispatch_once_t once;
    static YelpClient *instance;
    
    dispatch_once(&once, ^{
        instance = [[YelpClient alloc] initWithBaseURL:YELP_BASE_URL];
    });
    
    return instance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url key:YELP_CONSUMER_KEY secret:YELP_CONSUMER_SECRET];
    if (self) {
        self.accessToken = [[AFOAuth1Token alloc] initWithKey:YELP_TOKEN
                                                       secret:YELP_TOKEN_SECRET
                                                      session:nil
                                                   expiration:[NSDate distantFuture]
                                                    renewable:NO];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

- (void)searchWithLatitude:(float)latitude andLongitude:(float)longitude success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:@{@"term" : @"boba", @"sort" : @"1"}];
    [params setObject:[NSString stringWithFormat:@"%f,%f",latitude, longitude] forKey:@"ll"];
    [self getPath:@"v2/search" parameters:params success:success failure:failure];}

- (void)businessWithId:(NSString *)id success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/business/%@",id];
    [self getPath:path parameters:nil success:success failure:failure];
}

@end
