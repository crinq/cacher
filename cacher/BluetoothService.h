
typedef enum {
	kDeactivated = 1,
	kActivated
} ManagerState;

@protocol BluetoothServiceListener;

@interface BluetoothService : NSObject {
@private
	ManagerState state;
	NSMutableSet *listeners;
}

// shared instance
+(BluetoothService *) sharedInstance;

@property (nonatomic, retain) NSMutableSet *listeners;
@property (nonatomic, retain) NSString *messageValue; 

-(void) activate;
-(void) handlePacket_Data:(uint8_t *)packet:(uint16_t) size;

// listeners
-(void) addListener:(id<BluetoothServiceListener>)listener;
-(void) removeListener:(id<BluetoothServiceListener>)listener;

// event sender
-(void) sendActivatedEvent;
-(void) sendDeactivatedEvent;
-(void) sendRfcommChannelOpenedEvent;
-(void) sendMessageReceivedEvent:(NSString*) message;

@end

@protocol BluetoothServiceListener
@optional

// Activation events
-(void) activated:(BluetoothService*) manager;
//-(void) btstackManager:(BluetoothService*)manager activationFailed:(BTstackError)error;
-(void) deactivated:(BluetoothService*) manager;
-(void) messageReceived:(NSString*) message;
-(void) rfcommChannelOpened;

@end