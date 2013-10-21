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

#define ACCESS_TOKEN_DEFAULTS_KEY @"BobaAccessTokenKey"

@implementation YelpClient

+ (YelpClient *)instance
{
    static dispatch_once_t once;
    static YelpClient *instance;
    
    dispatch_once(&once, ^{
        instance = [[YelpClient alloc] initWithBaseURL:YELP_BASE_URL key:YELP_CONSUMER_KEY secret:YELP_CONSUMER_SECRET];
    });
    
    return instance;
}

- (id)initWithBaseURL:(NSURL *)url key:(NSString *)key secret:(NSString *)secret
{
    self = [super initWithBaseURL:url key:key secret:secret];
    if (self) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:ACCESS_TOKEN_DEFAULTS_KEY];
        if (data) {
            self.accessToken = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    }
    return self;
}

- (void)setAccessToken:(AFOAuth1Token *)accessToken
{
    [super setAccessToken:accessToken];
    
    if (accessToken) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:accessToken];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:ACCESS_TOKEN_DEFAULTS_KEY ];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:ACCESS_TOKEN_DEFAULTS_KEY];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)authorizeWithCallbackUrl:(NSURL *)callbackUrl success:(void (^)(AFOAuth1Token *, id))success failure:(void (^)(NSError *))failure
{
    self.accessToken = nil;
    [super authorizeUsingOAuthWithRequestTokenPath:@"oauth/request_token" userAuthorizationPath:@"oauth/authorize" callbackURL:callbackUrl accessTokenPath:@"oauth/access_token" accessMethod:@"POST" scope:nil success:success failure:failure];
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
