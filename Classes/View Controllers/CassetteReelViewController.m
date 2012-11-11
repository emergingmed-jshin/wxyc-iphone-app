//
//  CassetteReelViewController.m
//  WXYCapp
//
//  Created by Jake on 10/13/10.
//  Copyright 2010 WXYC. All rights reserved.
//

#import "CassetteReelViewController.h"
#import "AudioStreamer.h"

@implementation CassetteReelViewController

- (void)playbackStateChanged:(NSNotification *)aNotification 
{
//	if ([[aNotification object] class] != [AudioStreamer class])
//		return;
//	
//	AudioStreamer* stream = (AudioStreamer*) [aNotification object];
//	AudioStreamerState state = stream.state;
//	
//	if(state == AS_PLAYING) {
//		[self startAnimation];
//	} else {
//		[self stopAnimation];
//	}
		
}

- (CassetteReelViewController*)initWithImageView:(UIImageView*)imageView {
	if (!(self = [super initWithImageView:imageView]))
		return nil;

	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(playbackStateChanged:)
	 name:ASStatusChangedNotification
	 object:nil];
	
	return self;
}

@end