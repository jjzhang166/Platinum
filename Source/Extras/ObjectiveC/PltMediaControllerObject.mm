//
//  PltMediaControllerObject.m
//  Platinum
//
//  Created by joker on 2016/12/2.
//
//
#import "Platinum.h"
#import "PltUPnPObject.h"
#import "PltMediaControllerObject.h"

class PLT_MediaControllerDelegate_Wrapper : public PLT_MediaControllerDelegate {
public:
    PLT_MediaControllerDelegate_Wrapper(PLT_MediaControllerObject* target) : m_Target(target) {}
    
    bool OnMRAdded(PLT_DeviceDataReference& device) {
        
        if (![m_Target.delegate respondsToSelector:@selector(OnMRAdded:)]) return false;
        
        PLT_DeviceDataObject *deviceData = [[PLT_DeviceDataObject alloc] initWithDevice:device];
        
        return [m_Target.delegate OnMRAdded:deviceData];
    }
    
    void OnMRRemoved(PLT_DeviceDataReference& device) {
        
        if (![m_Target.delegate respondsToSelector:@selector(OnMRRemoved:)]) return;
        
        PLT_DeviceDataObject *deviceData = [[PLT_DeviceDataObject alloc] initWithDevice:device];
        
        [m_Target.delegate OnMRRemoved:deviceData];
        
    }
    
    void OnMRStateVariablesChanged(PLT_Service*                   service,
                                   NPT_List<PLT_StateVariable*>*  vars    ) {
        
        if (![m_Target.delegate respondsToSelector:@selector(OnMRStateVariablesChanged:StateVariables:)]) return;
        
        PLT_ServiceObject * serviceData = [[PLT_ServiceObject alloc] initWithService:service];
        
        NSMutableArray<PLT_StateVariableObject *>* varsData = [NSMutableArray array];
        NPT_List<PLT_StateVariable*>::Iterator iterator = vars->GetFirstItem();
        while(iterator) {
            PLT_StateVariableObject *state = [[PLT_StateVariableObject alloc] initWithStateVariable:*iterator];
            [varsData addObject:state];
            iterator++;
        }
    
        [m_Target.delegate OnMRStateVariablesChanged:serviceData StateVariables:varsData];
    }
    
    // AVTransport
    void OnGetCurrentTransportActionsResult(
                                            NPT_Result               /* res */,
                                            PLT_DeviceDataReference& /* device */,
                                            PLT_StringList*          /* actions */,
                                            void*                    /* userdata */) {
        
    }
    
    void OnGetDeviceCapabilitiesResult(
                                       NPT_Result               /* res */,
                                       PLT_DeviceDataReference& /* device */,
                                       PLT_DeviceCapabilities*  /* capabilities */,
                                       void*                    /* userdata */) {
        
    }
    
    void OnGetMediaInfoResult(
                              NPT_Result               /* res */,
                              PLT_DeviceDataReference& /* device */,
                              PLT_MediaInfo*           /* info */,
                              void*                    /* userdata */) {
        
    }
    
    void OnGetPositionInfoResult(
                                 NPT_Result               /* res */,
                                 PLT_DeviceDataReference& /* device */,
                                 PLT_PositionInfo*        /* info */,
                                 void*                    /* userdata */) {
        
    }
    
    void OnGetTransportInfoResult(
                                  NPT_Result               /* res */,
                                  PLT_DeviceDataReference& /* device */,
                                  PLT_TransportInfo*       /* info */,
                                  void*                    /* userdata */) {
        
    }
    
    void OnGetTransportSettingsResult(
                                      NPT_Result               /* res */,
                                      PLT_DeviceDataReference& /* device */,
                                      PLT_TransportSettings*   /* settings */,
                                      void*                    /* userdata */) {
        
    }
    
    void OnNextResult(
                      NPT_Result               /* res */,
                      PLT_DeviceDataReference& /* device */,
                      void*                    /* userdata */) {
        
    }
    
    void OnPauseResult(
                       NPT_Result               /* res */,
                       PLT_DeviceDataReference& /* device */,
                       void*                    /* userdata */) {
        
    }
    
    void OnPlayResult(
                      NPT_Result               /* res */,
                      PLT_DeviceDataReference& /* device */,
                      void*                    /* userdata */) {
        
    }
    
    void OnPreviousResult(
                          NPT_Result               /* res */,
                          PLT_DeviceDataReference& /* device */,
                          void*                    /* userdata */) {
        
    }
    
    void OnSeekResult(
                      NPT_Result               /* res */,
                      PLT_DeviceDataReference& /* device */,
                      void*                    /* userdata */) {
        
    }
    
    void OnSetAVTransportURIResult(
                                   NPT_Result               /* res */,
                                   PLT_DeviceDataReference& /* device */,
                                   void*                    /* userdata */) {
        
    }
    
    void OnSetPlayModeResult(
                             NPT_Result               /* res */,
                             PLT_DeviceDataReference& /* device */,
                             void*                    /* userdata */) {
        
    }
    
    void OnStopResult(
                      NPT_Result               /* res */,
                      PLT_DeviceDataReference& /* device */,
                      void*                    /* userdata */) {
        
    }
    
    // ConnectionManager
    void OnGetCurrentConnectionIDsResult(
                                         NPT_Result               /* res */,
                                         PLT_DeviceDataReference& /* device */,
                                         PLT_StringList*          /* ids */,
                                         void*                    /* userdata */) {
        
    }
    
    void OnGetCurrentConnectionInfoResult(
                                          NPT_Result               /* res */,
                                          PLT_DeviceDataReference& /* device */,
                                          PLT_ConnectionInfo*      /* info */,
                                          void*                    /* userdata */) {
        
    }
    
    void OnGetProtocolInfoResult(
                                 NPT_Result               /* res */,
                                 PLT_DeviceDataReference& /* device */,
                                 PLT_StringList*          /* sources */,
                                 PLT_StringList*          /* sinks */,
                                 void*                    /* userdata */) {
        
    }
    
    // RenderingControl
    void OnSetMuteResult(
                         NPT_Result               /* res */,
                         PLT_DeviceDataReference& /* device */,
                         void*                    /* userdata */) {
        
    }
    
    void OnGetMuteResult(
                         NPT_Result               /* res */,
                         PLT_DeviceDataReference& /* device */,
                         const char*              /* channel */,
                         bool                     /* mute */,
                         void*                    /* userdata */) {
        
    }
    
    void OnSetVolumeResult(
                           NPT_Result               /* res */,
                           PLT_DeviceDataReference& /* device */,
                           void*                    /* userdata */) {
        
    }
    
    void OnGetVolumeResult(
                           NPT_Result               /* res */,
                           PLT_DeviceDataReference& /* device */,
                           const char*              /* channel */,
                           NPT_UInt32                 /* volume */,
                           void*                    /* userdata */) {
        
    }
private:
    PLT_MediaControllerObject* m_Target;
};


@interface PLT_MediaControllerObject(){
    
@private PLT_MediaController *_mediaController;
    
@private PLT_MediaControllerDelegate_Wrapper *_wrapper;
    
}

@property (nonatomic) PLT_UPnPObject* upnp;

@end


@implementation PLT_MediaControllerObject

- (instancetype)init {
    
    if(self = [super init]) {
        
        _upnp = [[PLT_UPnPObject alloc] init];
        
        PLT_CtrlPointReference ctrlPoint(new PLT_CtrlPoint());
        PLT_CtrlPointObject *ctrlPointObj = [[PLT_CtrlPointObject alloc] init];
        [ctrlPointObj setCtrlPoint:&ctrlPoint];
        
        [_upnp addCtrlPoint:ctrlPointObj];
        
        _mediaController = new PLT_MediaController([ctrlPointObj getCtrlPoint]);
        
    }
    
    return self;
}

-(void)dealloc {
    
    delete _mediaController;
}

-(void)upnpStart {
    
    if(_wrapper == NULL) {
        _wrapper = new PLT_MediaControllerDelegate_Wrapper(self);
        _mediaController->SetDelegate(_wrapper);
    }
    
    [self.upnp start];
}

-(void)upnpStop {
    
    [self.upnp stop];
    
    if(_wrapper) {
        _mediaController->SetDelegate(NULL);
        delete _wrapper;
        _wrapper = NULL;
    }
}
@end
