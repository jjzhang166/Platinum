//
//  PltMediaObjects.m
//  MediaCrawler
//
//  Created by joker on 2018/4/5.
//

#import "PltMediaObjects.h"

@implementation PLT_DeviceDataObject
-(instancetype)initWithDevice:(PLT_DeviceDataReference &)deviceData {
    if(self = [super init]) {
        _description_url = [NSURL URLWithString:[NSString fromNPT_String:(*deviceData).GetDescriptionUrl()]];
        _uuid = [NSString fromNPT_String:(*deviceData).GetUUID()];
        _lease_time = (*deviceData).GetLeaseTime();
        _device_type = [NSString fromNPT_String:(*deviceData).GetType()];
        _friendly_name = [NSString fromNPT_String:(*deviceData).GetFriendlyName()];
    }
    return self;
}
-(NSUInteger)hash{
    return self.uuid.hash;
}
-(BOOL)isEqual:(PLT_DeviceDataObject *)object {
    return [self.uuid isEqual:object.uuid];
}
@end

@implementation PLT_ServiceObject
-(instancetype)initWithService:(PLT_Service *)service {
    if(self = [super init]) {
        service->GetDevice();
        
    }
    return self;
}
@end

@implementation PLT_StateVariableObject
-(instancetype)initWithStateVariable:(PLT_StateVariable *)stateVariable {
    if(self = [super init]) {
        stateVariable->GetName();
    }
    return self;
}
@end


@implementation NSString(NPT_String)
+(NSString *)fromNPT_String:(NPT_String)string {
    return [NSString stringWithCString:string.GetChars() encoding:NSUTF8StringEncoding];
}
@end
