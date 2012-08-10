#import "BluetoothService.h"

#import <btstack/btstack.h>
#import <btstack/hci_cmds.h>
#import <btstack/run_loop.h>
#import <btstack/utils.h>

static BluetoothService * m_BluetoothService = nil;
//00:11:a5:30:2c:5a
bd_addr_t _addr = { 0x00, 0x11, 0xa5, 0x30, 0x2c, 0x5a };
int _rfcomm_channel = 1;

@interface BluetoothService (privat)
- (void)handlePacket:(uint8_t) packet_type forChannel:(uint16_t) channel andData:(uint8_t *)packet withLen:(uint16_t) size;
@end

static void packet_handler(uint8_t packet_type, uint16_t channel, uint8_t *packet, uint16_t size)
{
	[m_BluetoothService handlePacket:packet_type forChannel:channel andData:packet withLen:size];
}

@implementation BluetoothService

@synthesize listeners;
@synthesize messageValue;

-(BluetoothService *) init {
	self = [super init];
	if (!self) 
	{
		return self;
	}
	state = kDeactivated;
	[self setListeners:[[NSMutableSet alloc] init]];
	
	run_loop_init(RUN_LOOP_COCOA);
	bt_register_packet_handler(packet_handler);
	return self;
}

+(BluetoothService *) sharedInstance 
{
	if (!m_BluetoothService) 
	{
		m_BluetoothService = [[BluetoothService alloc] init];
	}
	
	return m_BluetoothService;
}

-(void) activate
{
	bt_open();
	//TODO fehler abfangen
	bt_send_cmd(&btstack_set_power_mode, HCI_POWER_ON);
}

-(void) addListener:(id<BluetoothServiceListener>)listener
{
	[listeners addObject:listener];
}

-(void) removeListener:(id<BluetoothServiceListener>)listener{
	[listeners removeObject:listener];
}

-(void) handlePacket:(uint8_t)packet_type forChannel:(uint16_t)channel andData:(uint8_t *)packet withLen:(uint16_t) size {
	bd_addr_t event_addr;
	uint16_t mtu;
	uint16_t rfcomm_channel_id;
		
	switch (packet_type) 
	{		
		case RFCOMM_DATA_PACKET:
			[self handlePacket_Data:packet:size];
			break;
			
		case HCI_EVENT_PACKET:
			switch (packet[0]) {
					
				case BTSTACK_EVENT_POWERON_FAILED:
					// handle HCI init failure
					printf("HCI Init failed - make sure you have turned off Bluetooth in the System Settings\n");
					exit(1);
					break;		
					
				case BTSTACK_EVENT_STATE:
					// bt stack activated, get started
                    if (packet[2] == HCI_STATE_WORKING) 
					{
						bt_send_cmd(&rfcomm_create_channel, _addr, _rfcomm_channel);
						
						[self sendActivatedEvent];
					}
					break;
					
				case HCI_EVENT_PIN_CODE_REQUEST:
					// inform about pin code request
					printf("Using PIN 0000\n");
					bt_flip_addr(event_addr, &packet[2]); 
					bt_send_cmd(&hci_pin_code_request_reply, &event_addr, 4, "0000");
					break;
					
				case RFCOMM_EVENT_OPEN_CHANNEL_COMPLETE:
					// data: event(8), len(8), status (8), address (48), handle(16), server channel(8), rfcomm_cid(16), max frame size(16)
					if (packet[2]) 
					{
						printf("RFCOMM channel open failed, status %u\n", packet[2]);
					} else 
					{
						rfcomm_channel_id = READ_BT_16(packet, 12);
						mtu = READ_BT_16(packet, 14);
						printf("RFCOMM channel open succeeded. New RFCOMM Channel ID %u, max frame size %u\n", rfcomm_channel_id, mtu);
						[self sendRfcommChannelOpenedEvent];
					}
					break;

				case RFCOMM_EVENT_PERSISTENT_CHANNEL:
					break;
					
				case HCI_EVENT_DISCONNECTION_COMPLETE:
					// connection closed -> quit test app
					printf("Basebank connection closed\n");
					[self sendDeactivatedEvent];
					break;
					
				default:
					break;
			}
			break;
		default:
			break;
	}
}

-(void) handlePacket_Data:(uint8_t *)packet:(uint16_t) size
{
	int i;
	for (i=0; i < size; i++)
	{
		uint8_t data = ((uint8_t *)packet)[i];
		if (data == '\n')
		{
			NSString * msg = [NSString stringWithFormat:@"%@", self.messageValue];
			[self sendMessageReceivedEvent:msg];
			self.messageValue = @"";
		}
		else
		{
			self.messageValue = [NSString stringWithFormat:@"%@%c", self.messageValue, data];
		}
	}
}

-(void) sendActivatedEvent
{
	for (NSObject<BluetoothServiceListener>* listener in listeners) 
	{
		if ([listener respondsToSelector:@selector(activated:)])
		{
			[listener activated:self];
		}
	}
}

-(void) sendDeactivatedEvent
{
	for (NSObject<BluetoothServiceListener>* listener in listeners) 
	{
		if ([listener respondsToSelector:@selector(deactivated:)])
		{
			[listener deactivated:self];
		}
	}
} 

-(void) sendRfcommChannelOpenedEvent
{
	for (NSObject<BluetoothServiceListener>* listener in listeners) 
	{
		if ([listener respondsToSelector:@selector(rfcommChannelOpened)])
		{
			[listener rfcommChannelOpened];
		}
	}
} 

-(void) sendMessageReceivedEvent:(NSString*) message
{
	for (NSObject<BluetoothServiceListener>* listener in listeners) 
	{
		if ([listener respondsToSelector:@selector(messageReceived:)])
		{
			[listener messageReceived:message];
		}
	}
}

@end