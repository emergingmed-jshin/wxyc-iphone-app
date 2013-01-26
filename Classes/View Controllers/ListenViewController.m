//
//  Created by Jake Bromberg.
//  Copyright WXYC 2009-10. All rights reserved.
//

#import "ListenViewController.h"
#import "AudioStreamer.h"
#import "AudioStreamController.h"

@class CassetteReelViewController;

@interface ListenViewController()

@property (nonatomic, strong) AudioStreamController* streamController;

@end


@implementation ListenViewController

- (IBAction)pushPlay:(id)sender
{
	if ([_streamController isPlaying])
		return;

	[_streamController start];
}

- (IBAction)pushStop:(id)sender
{
	[_streamController stop];
}

//TODO: All of the views in this code block should have controllers that respond to changing states themselves
- (void)setViewToPlayingState:(BOOL)isPlaying
{
	_GreenLED.hidden = !isPlaying;
	_RedLED.hidden = !isPlaying;
}

- (void)playbackStateChanged:(NSNotification *)aNotification
{
	[self setViewToPlayingState:[_streamController isPlaying]];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSURL *const url =
	#if TARGET_IPHONE_SIMULATOR
		[NSURL URLWithString:@"http://localhost/Masks.mp3"];
	#else
		[NSURL URLWithString:@"http://152.46.7.128:8000/wxyc.mp3"];
	#endif

	self.streamController = [[AudioStreamController alloc] initWithURL:url];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged:) name:ASStatusChangedNotification object:nil];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end