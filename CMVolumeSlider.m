//
//  CMVolumeSlider.m
//
//  Created by Jelle De Laender on 20/05/12.
//  Updated by Jelle De Laender on 06/08/12.
//
//  https://github.com/CodingMammoth/CMVolumeSlider
//

#import "CMVolumeSlider.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation CMVolumeSlider

- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(systemVolumeChanged:)
                                                     name:@"AVSystemController_SystemVolumeDidChangeNotification"
                                                   object:nil];
        
        [self setMaximumValue:1.0];
        [self setMinimumValue:0.0];
        
        // current value
        [self systemVolumeChanged:nil];
        [self setBackgroundColor:[UIColor clearColor]];
        
        // Fix to hide volume popover
        MPVolumeView *volumeView = [[[MPVolumeView alloc] initWithFrame:
                                     CGRectMake(-500, -500, 10, 10)] autorelease];
        [self addSubview:volumeView];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(systemVolumeChanged:)
                                                     name:@"AVSystemController_SystemVolumeDidChangeNotification"
                                                   object:nil];
        [self setMaximumValue:1.0];
        [self setMinimumValue:0.0];
        
        // current value
        [self systemVolumeChanged:nil];
        [self setBackgroundColor:[UIColor clearColor]];
        
        // Fix to hide volume popover
        MPVolumeView *volumeView = [[[MPVolumeView alloc] initWithFrame:
                                     CGRectMake(-500, -500, 10, 10)] autorelease];
        [self addSubview:volumeView];
    }
    
    return self;
}


- (void)systemVolumeChanged:(NSNotification*)aNotification
{
    [self setValue:[MPMusicPlayerController applicationMusicPlayer].volume];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [[MPMusicPlayerController applicationMusicPlayer] setVolume:self.value];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
