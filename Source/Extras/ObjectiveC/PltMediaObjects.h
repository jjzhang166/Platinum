//
//  PltMediaObjects.h
//  MediaCrawler
//
//  Created by joker on 2018/4/5.
//

#import <Foundation/Foundation.h>
#import "Platinum.h"

@interface PLT_DeviceDataObject : NSObject
-(instancetype)initWithDevice:(PLT_DeviceDataReference &)deviceData;
@end

@interface PLT_ServiceObject: NSObject
-(instancetype)initWithService:(PLT_Service *)service;
@end

@interface PLT_StateVariableObject: NSObject
-(instancetype)initWithStateVariable:(PLT_StateVariable*)stateVariable;
@end
