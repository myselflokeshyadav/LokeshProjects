//
//  ViewController.m
//  SocialNetworking
//
//  Created by Lokesh Yadav on 04/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

#import "ViewController.h"
#import "NSUserDefaults+CXExtension.h"
@interface ViewController ()
@property (nonatomic,strong) FBSDKLoginManager *login;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self setUserProfile];
         [_btnLogout setHidden:NO];
        // User is logged in, do work such as go to next view controller.
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFacebook_tapped:(id)sender {
    if ([[NSUserDefaults AccessToken] length]>0) {
        [_btnLogout setHidden:NO];
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }else{
        _login = [[FBSDKLoginManager alloc] init];
        [_login
         logInWithReadPermissions: @[@"public_profile", @"user_friends", @"email"]
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (error) {
                 NSLog(@"Process error");
             } else if (result.isCancelled) {
                 NSLog(@"Cancelled");
             } else {
                 NSLog(@"Logged in");
                 [_btnLogout setHidden:NO];
                 // Get my profile
                 [NSUserDefaults setAccessToken:result.token.tokenString];
                 [NSUserDefaults setUserId:result.token.userID];
                 [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                  startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                      
                      if (!error) {
                          NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                          //http://graph.facebook.com/[UID]/picture
                          //http://graph.facebook.com/1046272082058260/picture?type=original
                          [NSUserDefaults setUserName:[result valueForKey:@"name"]];
                          [self setUserProfile];
                      }
                  }];
                 
             }
         }];

    }
}
-(void)setUserProfile
{
    _ussrNameLabele.text = [NSUserDefaults UserName];
    
    NSURLResponse *response;
    NSError *error;
    NSString *strImageUrl = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",[NSUserDefaults UserId]] ;
    NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strImageUrl]] returningResponse:&response error:&error];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ([httpResponse statusCode] == 200) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _ProfileIamgeView.image = [UIImage imageWithData:data];
        });
    }

}
- (IBAction)btnTwitter_tapped:(id)sender {
}

- (IBAction)btnInstagram_tapped:(id)sender {
}

- (IBAction)btnLinkedin_tapped:(id)sender {
}

- (IBAction)LogoutBtn_tapped:(id)sender {

    [_login logOut];
    [NSUserDefaults setAccessToken:nil];
    [NSUserDefaults setUserId:nil];
    [NSUserDefaults setUserName:nil];
    _login = nil;
     [_btnLogout setHidden:YES];
    

    [FBSDKAccessToken setCurrentAccessToken:nil];
    [FBSDKProfile setCurrentProfile:nil];
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies])
    {
        NSString* domainName = [cookie domain];
        NSRange domainRange = [domainName rangeOfString:@"facebook"];
        if(domainRange.length > 0)
        {
            [storage deleteCookie:cookie];
        }
    }
    if ([FBSDKAccessToken currentAccessToken]) {
        [self setUserProfile];
        [_btnLogout setHidden:NO];
        // User is logged in, do work such as go to next view controller.
    }
    
}
@end
