//
//  ViewController.h
//  WhereAmI
//
//  Created by 关东升 on 13-1-6.
//  本书网站：http://www.iosbook3.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapLocation.h"

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtQueryKey;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)geocodeQuery:(id)sender;

@end
