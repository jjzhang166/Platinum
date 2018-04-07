//
//  ViewController.m
//  MobileMediaController
//
//  Created by joker on 2016/12/1.
//
//

#import "ViewController.h"
#import "AnotherViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *hintLabel;
@end

@implementation ViewController
-(UILabel *)hintLabel {
    if(_hintLabel == nil) {
        _hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
        _hintLabel.textColor = [UIColor redColor];
        _hintLabel.font = [UIFont boldSystemFontOfSize:18];
        _hintLabel.textAlignment = NSTextAlignmentCenter;
        _hintLabel.center = self.view.center;
        _hintLabel.text = @"点击右上方搜索设备";
    }
    return _hintLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *findDeviceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pressed:)];
    
    self.navigationItem.rightBarButtonItem = findDeviceItem;
    
    self.title = @"DLNA DMC Demo";
    
    [self.view addSubview:self.hintLabel];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    CGRect frame = self.hintLabel.frame;
    frame.size.width = size.width;
    frame.origin.x = 0;
    frame.origin.y = (size.height - frame.size.height) / 2.0;
    self.hintLabel.frame = frame;
}
-(void)pressed:(UIButton *)sender {
    AnotherViewController *vc = [[AnotherViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
