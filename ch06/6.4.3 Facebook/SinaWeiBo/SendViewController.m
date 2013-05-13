//
//  SendViewController.m
//  WeiBo
//
//  Created by 关东升 on 13-1-4.
//  本书网站：http://www.iosbook3.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import "SendViewController.h"

@interface SendViewController ()

@end

@implementation SendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:
                                  ACAccountTypeIdentifierFacebook];
    
    // 指定权限
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
    //设置你的应用Facebook应用程序ID
    [options setObject:@"111111111111" forKey:ACFacebookAppIdKey];
    //设置请求权限
    [options setObject:@[@"publish_actions"] forKey:ACFacebookPermissionsKey];
    //设置发布权限
    [options setObject:ACFacebookAudienceFriends forKey:ACFacebookAudienceKey];
    

    [account requestAccessToAccountsWithType:accountType options:options
                                  completion:^(BOOL granted, NSError *error)
     {
         if (granted == YES)
         {
             NSArray *arrayOfAccounts = [account
                                         accountsWithAccountType:accountType];
             
             if ([arrayOfAccounts count] > 0)
             {
                 ACAccount *fbAccount = [arrayOfAccounts lastObject];
                 
                 NSDictionary *parameters = [NSDictionary dictionaryWithObject:_textView.text forKey:@"message"];
                 
                 NSURL *requestURL = [NSURL
                                      URLWithString:@"https://graph.facebook.com/me/feed"];
                 
                 SLRequest *request = [SLRequest
                                           requestForServiceType:SLServiceTypeFacebook
                                           requestMethod:SLRequestMethodPOST
                                           URL:requestURL parameters:parameters];
                 
                 
                 request.account = fbAccount;
                 
                 [request performRequestWithHandler:^(NSData *responseData,
                                                          NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      NSLog(@" HTTP response: %i", [urlResponse statusCode]);
                  }];
             }
         };
     }];
    
    //放弃第一响应者
    [_textView resignFirstResponder];
    //关闭模态视图
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    
    //放弃第一响应者
    [_textView resignFirstResponder];
    //关闭模态视图
    [self dismissViewControllerAnimated:YES completion:nil];
}


//TextView 委托方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{    
    NSString *content = _textView.text;
    NSInteger counter = 140 - [content length];
    
    if (counter <=0) {
        _lblCharCounter.text = @"0";
        return NO;
    }
    _lblCharCounter.text = [NSString stringWithFormat:@"%i", counter];
    return YES;
}

@end
