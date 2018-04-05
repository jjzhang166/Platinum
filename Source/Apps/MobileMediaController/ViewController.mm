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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.backgroundColor = UIColor.redColor;
    [btn addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;
}

-(void)pressed:(UIButton *)sender {
    AnotherViewController *vc = [[AnotherViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
