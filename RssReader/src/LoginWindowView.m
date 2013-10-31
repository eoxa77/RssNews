//
//  LoginWindowView.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "LoginWindowView.h"

@interface LoginWindowView()<UITextFieldDelegate, UITextViewDelegate>

@property (strong)  UIImageView* imageOnTopScreen;
@property (strong)  UILabel* loginLabel;
@property (strong)  UILabel* passwordLabel;
@property (strong)  UITextField* loginTextField;
@property (strong)  UITextField* passwordTextField;
@property (strong)  UIButton* loginButton;
@property (strong)  UITextView* whoCreateTextView;

@end

@implementation LoginWindowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage* imageOfCat = [UIImage imageNamed:@"cat.jpeg"];
        _imageOnTopScreen = [UIImageView new];
        _imageOnTopScreen.image = imageOfCat;
        _imageOnTopScreen.frame = CGRectMake( (CGRectGetWidth(self.bounds) / 2) - 96, 20, 192, 80);
        [self addSubview:self.imageOnTopScreen];
        
        _loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) / 2 - 50, 105, 100, 20)];
        _loginLabel.text = @"Login";
        _loginLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_loginLabel];
        
        _loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) / 2 - 50, 125, 100, 20)];
        _loginTextField.borderStyle = UITextBorderStyleRoundedRect;
        _loginTextField.delegate = self;
        [self addSubview:_loginTextField];
        
        _passwordLabel = [UILabel new];
        _passwordLabel.text = @"Password";
        _passwordLabel.textAlignment = NSTextAlignmentCenter;
        [_passwordTextField setHidden:YES];
        [self addSubview:_passwordLabel];
        
        _passwordTextField = [UITextField new];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.delegate = self;
        //_passwordTextField.textAlignment = UIKeyboardDidHideNotification;
        _passwordTextField.secureTextEntry = YES;
        [self addSubview:_passwordTextField];
        
        _loginButton = [UIButton new];
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton setImage:[UIImage imageNamed:@"Login_button.jpg"] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginButton];
        
        _whoCreateTextView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) / 2 - 70, CGRectGetHeight(self.bounds) - 150, 150, 100)];
        _whoCreateTextView.delegate = self;
        [_whoCreateTextView setUserInteractionEnabled:NO];
        _whoCreateTextView.text = @"Create By Egor 2013";
        _whoCreateTextView.font = [UIFont systemFontOfSize:30.0f];
        [self addSubview:_whoCreateTextView];
        
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return NO;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
        [textField resignFirstResponder];
    

    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void) press
{
    if((self.delegate && [self.delegate respondsToSelector:@selector(loginInToApplication:WithLogin:AndPassword:)]))
    {
        MainWindowTabBarController* mainWindowTabBarController = [MainWindowTabBarController new];
        mainWindowTabBarController.currentLogin = _loginTextField.text;
        mainWindowTabBarController.currentPassword = _passwordTextField.text;
        [self.delegate loginInToApplication:mainWindowTabBarController.view WithLogin:_loginTextField.text AndPassword:_passwordTextField.text];
        
    }
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    if (CGRectGetWidth(self.bounds)>CGRectGetHeight(self.bounds)) {
        _whoCreateTextView.frame = CGRectMake(CGRectGetWidth(self.bounds)/2 + 50, 5, 150, 100);
        _passwordLabel.frame = CGRectMake(CGRectGetWidth(self.bounds)/2 + 50, 105, 100, 20);
        _passwordTextField.frame = CGRectMake(CGRectGetWidth(self.bounds)/2 + 50, 125, 100, 20);
        _loginButton.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2 - 35, 125, 50, 20);
    }
    else {
        _whoCreateTextView.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2 - 70, CGRectGetHeight(self.bounds) - 150, 150, 100);
        _passwordLabel.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2 - 50, 160, 100, 20);
        _passwordTextField.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2 - 50, 185, 100, 20);
        _loginButton.frame = CGRectMake(CGRectGetWidth(self.bounds) / 2 - 25, 220, 50, 20);
    }
}

@end
