//
//  ViewController.m
//  Project4
//
//  Created by Russell Carlin on 9/18/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.5f, 100.0f, 20.0f)];
    if (username != nil){
        username.text = @"Username:";
        [self.view addSubview:username];
    }
    
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(110.0f, 10.0f, 200.0f, 25.0f)];
    if (usernameTextField != nil) {
        usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:usernameTextField];
    }
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginButton != nil){
        loginButton.frame = CGRectMake(230.0f, 45.0f, 80.0f, 40.0f);
        loginButton.tintColor = [UIColor darkGrayColor];
        [loginButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    
    UILabel *display = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 320.0f, 60.0f)];
    if (display != nil){
        display.text = @"Please Enter Username";
        display.textAlignment = UITextAlignmentCenter;
        display.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:display];
    }
    
    
}
- (void)onClick
{
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
