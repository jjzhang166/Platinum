//
//  AnotherViewController.m
//  MediaCrawler
//
//  Created by joker on 2018/4/5.
//

#import "AnotherViewController.h"
#import "PltMediaControllerObject.h"
#import <Neptune/Neptune.h>
#import <Foundation/Foundation.h>

@interface AnotherViewController ()<PLT_MediaControllerDelegateObject,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) PLT_MediaControllerObject *controller;
@property (atomic, strong) NSMutableArray<PLT_DeviceDataObject*> *devices;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@end

@implementation AnotherViewController

-(UITableView *)tableView {
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

-(UIActivityIndicatorView *)activityView {
    if(_activityView == nil) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _activityView;
}

+ (void)initialize {
NPT_LogManager::GetDefault().Configure("plist:.level=INFO;.handlers=ConsoleHandler;.ConsoleHandler.outputs=1;.ConsoleHandler.filter=61");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.devices = [NSMutableArray array];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *indicator = [[UIBarButtonItem alloc] initWithCustomView:self.activityView];
    self.navigationItem.rightBarButtonItem = indicator;
    
    _controller = [[PLT_MediaControllerObject alloc] init];
    self.controller.delegate = self;
    
    [self startFindDevice];
}

-(void)startFindDevice {
    [self.activityView startAnimating];
    [self.controller upnpStart];
}

-(void)stopFindDevice {
    [self.activityView stopAnimating];
    [self.controller upnpStop];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self stopFindDevice];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devices.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deviceCell"];
    
    if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deviceCell"];
    }
    
    cell.textLabel.text = self.devices[indexPath.row].friendly_name;
    
    return cell;
}

#pragma mark - UITableViewDelegate
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - PLT_MediaControllerObject

-(bool)OnMRAdded:(PLT_DeviceDataObject *)device {

    [self.devices addObject:device];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
    return true;
}

- (void)OnMRRemoved:(PLT_DeviceDataObject *)device {
    NSLog(@"remove device");
}

- (void)OnMRStateVariablesChanged:(PLT_ServiceObject *)service StateVariables:(NSArray<PLT_StateVariableObject *> *)vars {
    NSLog(@"device state changed");
}
@end
