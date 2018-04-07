//
//  PltMediaControllerObject.h
//  Platinum
//
//  Created by joker on 2016/12/2.
//
//

#import <Foundation/Foundation.h>
#import "Neptune.h"
#import "PltMediaObjects.h"

@protocol PLT_MediaControllerDelegateObject

-(bool)OnMRAdded:(PLT_DeviceDataObject *)device;
-(void)OnMRRemoved:(PLT_DeviceDataObject *)device;
-(void)OnMRStateVariablesChanged:(PLT_ServiceObject *)service StateVariables:(NSArray<PLT_StateVariableObject*>*)vars;
@end

@interface PLT_MediaControllerObject: NSObject
@property (nonatomic, weak) id delegate;

- (void)upnpStart;
- (void)upnpStop;
@end


