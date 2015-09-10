//
//  ViewController.h
//  SocialNetworking
//
//  Created by Lokesh Yadav on 04/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnLogout;
@property (strong, nonatomic) IBOutlet UIImageView *TimelineImageView;
@property (strong, nonatomic) IBOutlet UIImageView *ProfileIamgeView;
@property (strong, nonatomic) IBOutlet UILabel *ussrNameLabele;

- (IBAction)btnFacebook_tapped:(id)sender;
- (IBAction)btnTwitter_tapped:(id)sender;
- (IBAction)btnInstagram_tapped:(id)sender;
- (IBAction)btnLinkedin_tapped:(id)sender;
- (IBAction)LogoutBtn_tapped:(id)sender;


@end

