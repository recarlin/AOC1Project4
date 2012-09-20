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
//local declaration of the username label since I don't need to use it anywhere else
    
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 12.5f, 100.0f, 20.0f)];
    if (username != nil){
        username.text = @"Username:";
        [self.view addSubview:username];
    }
    
//sets the textfield up with a rounded rectangle border and adds it to the ViewController
    
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(110.0f, 10.0f, 200.0f, 25.0f)];
    if (usernameTextField != nil) {
        usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:usernameTextField];
    }
    
//sets the rounded rectangle login button, formats and positions it, adds a target for when it is clicked, and adds it to the ViewController
    
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
    
//formats the UILabel used in displaying the login information; adds it to the ViewController
    
    loginDisplay = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 300.0f, 60.0f)];
    if (loginDisplay != nil){
        loginDisplay.text = @"Please Enter Username";
        loginDisplay.textAlignment = UITextAlignmentCenter;
        loginDisplay.backgroundColor = [UIColor darkGrayColor];
        loginDisplay.textColor = [UIColor lightGrayColor];
        loginDisplay.numberOfLines = 2;
        [self.view addSubview:loginDisplay];
    }
    
//same as the login button but different formatting
    
    dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (dateButton != nil){
        dateButton.frame = CGRectMake(10.0f, 180.0f, 300.0f, 40.0f);
        dateButton.tag = 1;
        [dateButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [dateButton setTintColor:[UIColor darkGrayColor]];
        [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateButton];
    }
    
//similar to other buttons but InfoDark type
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoButton != nil){
        infoButton.frame = CGRectMake(285.0f, 355.0f, 25.0f, 25.0f);
        infoButton.tag = 2;
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:infoButton];
    }
    
//UILabel used to display the info
    
    infoDisplay = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 390.0f, 300.0f, 60.0f)];
    if (infoDisplay != nil){
        infoDisplay.text = @"";
        infoDisplay.textAlignment = UITextAlignmentCenter;
        infoDisplay.numberOfLines = 2;
        infoDisplay.textColor = [UIColor lightGrayColor];
        [self.view addSubview:infoDisplay];
    }
    
}
- (void)onClick:(UIButton*)button;
{
//I used a switch to handle which button is clicked. Each button has a different tag, which controls the actions executed.
    switch (button.tag) {
        case 0:
        {
//First I set the text typed into the textfield as a NSString. Then, I have an if check to see if there is anything typed in. Finally, the appropriate text replaces the loginDisplay's text.
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
//Get the date, set a date formatter to long style date and full style time, make an alert view with the message as the date ran through the formatter. Oh, and show the alert.
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
//Last case changes to the infoDisplay's text to the string below and reveals the display by changing the background color.
            infoDisplay.text = @"This application was created by: Russell Carlin";
            infoDisplay.backgroundColor = [UIColor darkGrayColor];
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
