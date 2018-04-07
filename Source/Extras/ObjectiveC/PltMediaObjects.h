//
//  PltMediaObjects.h
//  MediaCrawler
//
//  Created by joker on 2018/4/5.
//

#import <Foundation/Foundation.h>
#import "Platinum.h"

@interface PLT_DeviceDataObject : NSObject

@property (nonatomic, strong) NSURL* description_url;
@property (nonatomic, copy  ) NSString *uuid;
@property (nonatomic, assign) NSTimeInterval lease_time;
@property (nonatomic, copy  ) NSString *device_type;
@property (nonatomic, copy  ) NSString *friendly_name;

-(instancetype)initWithDevice:(PLT_DeviceDataReference &)deviceData;
@end

@interface PLT_ServiceObject: NSObject
-(instancetype)initWithService:(PLT_Service *)service;
@end

@interface PLT_StateVariableObject: NSObject
-(instancetype)initWithStateVariable:(PLT_StateVariable*)stateVariable;
@end


@interface NSString(NPT_String)
+(NSString *)fromNPT_String:(NPT_String)string;
@end;
