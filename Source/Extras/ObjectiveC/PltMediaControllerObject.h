//
//  PltMediaControllerObject.h
//  Platinum
//
//  Created by joker on 2016/12/2.
//
//

#import <Foundation/Foundation.h>
#import "Neptune.h"

@protocol PLT_MediaControllerDelegateObject
@end

@interface PLT_MediaControllerObject: NSObject
@property (nonatomic, weak) id<PLT_MediaControllerDelegateObject> delegate;

- (void)upnpStart;
- (void)upnpStop;
@end


