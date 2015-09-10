//
//  NSUserDefaults+CXExtension.h
//  SocialNetworking
//
//  Created by Lokesh Yadav on 07/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CXExtension)

+ (NSString *)AccessToken;
+ (void)setAccessToken:(NSString *)accessToken;

+ (NSString *)UserId;
+ (void)setUserId:(NSString *)userId;

+ (NSString *)UserName;
+ (void)setUserName:(NSString *)userName;
@end
