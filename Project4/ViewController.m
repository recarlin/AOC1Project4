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
    
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(110.0f, 10.0f, 200.0f, 25.0f)];
    if (usernameTextField != nil) {
        usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:usernameTextField];
    }
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginButton != nil){
        loginButton.frame = CGRectMake(230.0f, 45.0f, 80.0f, 40.0f);
        loginButton.tag = 0;
        [loginButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [loginButton setTintColor:[UIColor darkGrayColor]];
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    
    loginDisplay = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 300.0f, 60.0f)];
    if (loginDisplay != nil){
        loginDisplay.text = @"Please Enter Username";
        loginDisplay.textAlignment = UITextAlignmentCenter;
        loginDisplay.backgroundColor = [UIColor lightGrayColor];
        loginDisplay.textColor = [UIColor darkGrayColor];
        loginDisplay.numberOfLines = 2;
        [self.view addSubview:loginDisplay];
    }
    
    dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (dateButton != nil){
        dateButton.frame = CGRectMake(10.0f, 180.0f, 300.0f, 40.0f);
        dateButton.tag = 1;
        [dateButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [dateButton setTintColor:[UIColor purpleColor]];
        [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateButton];
    }
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoButton != nil){
        infoButton.frame = CGRectMake(285.0f, 355.0f, 25.0f, 25.0f);
        infoButton.tag = 2;
        [infoButton setTitle:@"Show Date" forState:UIControlStateNormal];
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:infoButton];
    }
    
    infoDisplay = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 390.0f, 300.0f, 60.0f)];
    if (infoDisplay != nil){
        infoDisplay.text = @"";
        infoDisplay.textAlignment = UITextAlignmentCenter;
        infoDisplay.numberOfLines = 2;
        [self.view addSubview:infoDisplay];
    }
    
}
- (void)onClick:(UIButton*)button;
{
    switch (button.tag) {
        case 0:
        {
            NSString *userText = [usernameTextField text];
            if (userText.length == 0){
                loginDisplay.text = @"Username cannot be empty";
            } else {
                NSString *loggedText = [[NSString alloc]initWithFormat:@"User: %@ has been logged in", [usernameTextField text]];
                loginDisplay.text = loggedText;
            }
        }
            break;
        case 1:
        {
            NSDate *date = [NSDate date];
            NSDateFormatter *formattedDate = [[NSDateFormatter alloc]init];
            [formattedDate setDateStyle:NSDateFormatterLongStyle];
            [formattedDate setTimeStyle:NSDateFormatterFullStyle];
            
            UIAlertView *dateAlert = [[UIAlertView alloc]initWithTitle:@"Date" message:[formattedDate stringFromDate:date] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [dateAlert show];
        }
            break;
        case 2:
        {
            infoDisplay.text = @"This application was created by: Russell Carlin";
            infoDisplay.backgroundColor = [UIColor lightGrayColor];
            infoDisplay.textColor = [UIColor darkGrayColor];
        }
            break;
        
        default:
        {
            
        }
            break;
    }
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
