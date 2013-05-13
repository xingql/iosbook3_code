//
//  ViewController.h
//  MyPass
//
//  Created by 关东升 on 13-1-22.
//  本书网站：http://www.iosbook3.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

#import "PassKit/PassKit.h"
#import "DetailViewController.h"

#define SerialNumber @"gT6zrHkaW" 

@interface ViewController : UITableViewController <PKAddPassesViewControllerDelegate>

@property (strong, nonatomic) NSArray* passes;

- (IBAction)add:(id)sender;

@end
