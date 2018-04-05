//
//  ViewController.m
//  MobileMediaServer
//
//  Created by Sylvain Rebaud on 3/10/15.
//
//

#import "ViewController.h"
#import <Neptune/Neptune.h>
#import <Platinum/PltUPnPObject.h>
#import <Platinum/PltMediaServerObject.h>

@interface ViewController () <PLT_MediaServerDelegateObject>

@property (nonatomic) PLT_UPnPObject* upnp;

@end

@implementation ViewController

+ (void)initialize {
	NPT_LogManager::GetDefault().Configure("plist:.level=INFO;.handlers=ConsoleHandler;.ConsoleHandler.outputs=1;.ConsoleHandler.filter=61");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
	self.upnp = [[PLT_UPnPObject alloc] init];

	// create server and add ourselves as the delegate
	PLT_MediaServerObject* server = [[PLT_MediaServerObject alloc] init];
	server.delegate = self;

	[self.upnp addDevice:server];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	[self.upnp start];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - PLT_MediaServerDelegateObject

- (NPT_Result)onBrowseMetadata:(PLT_MediaServerBrowseCapsule*)info
{
    NSLog(@"%@",info.objectId);
	return NPT_FAILURE;
}

- (NPT_Result)onBrowseDirectChildren:(PLT_MediaServerBrowseCapsule*)info
{
    NSLog(@"%@",info.objectId);
	return NPT_FAILURE;
}

- (NPT_Result)onSearchContainer:(PLT_MediaServerSearchCapsule*)info
{
    NSLog(@"%@",info.objectId);
	return NPT_FAILURE;
}

- (NPT_Result)onFileRequest:(PLT_MediaServerFileRequestCapsule*)info
{
    NSLog(@"%@",info);
	return NPT_FAILURE;
}

@end
