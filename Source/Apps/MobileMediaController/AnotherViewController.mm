//
//  AnotherViewController.m
//  MediaCrawler
//
//  Created by joker on 2018/4/5.
//

#import "AnotherViewController.h"
#import "PltMediaControllerObject.h"
#import <Neptune/Neptune.h>

@interface AnotherViewController ()<PLT_MediaControllerDelegateObject>
@property (nonatomic, strong) PLT_MediaControllerObject *controller;
@end

@implementation AnotherViewController
+ (void)initialize {
NPT_LogManager::GetDefault().Configure("plist:.level=INFO;.handlers=ConsoleHandler;.ConsoleHandler.outputs=1;.ConsoleHandler.filter=61");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _controller = [[PLT_MediaControllerObject alloc] init];
    self.controller.delegate = self;
    [self.controller upnpStart];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.backgroundColor = UIColor.greenColor;
    [btn addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

-(void)viewDidDisappear:(BOOL)animated {
    [self.controller upnpStop];
}
-(void)pressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
