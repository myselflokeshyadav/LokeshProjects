//
//  NSUserDefaults+CXExtension.m
//  SocialNetworking
//
//  Created by Lokesh Yadav on 07/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

#import "NSUserDefaults+CXExtension.h"

@implementation NSUserDefaults (CXExtension)

+ (NSString *)AccessToken{
   return [[NSUserDefaults standardUserDefaults] objectForKey:@"AccessToken"];
}
+ (void)setAccessToken:(NSString *)accessToken{
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"AccessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)UserId{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UserId"];
}
+ (void)setUserId:(NSString *)userId{
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"UserId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)UserName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UserName"];
}
+ (void)setUserName:(NSString *)userName{
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
