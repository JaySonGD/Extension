//
//  SoundTools.m
//  25. 录音
//
//  Created by czljcb on 16/1/8.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "SoundTools.h"
#import <AVFoundation/AVFoundation.h>



@implementation SoundTools

static NSMutableDictionary *_soundPlayers;

+ (void)initialize
{
    _soundPlayers = [NSMutableDictionary dictionary];
}

+ (void)playSoundWithSoundName:(NSString *)soundName
{

    SystemSoundID soundID = [_soundPlayers[soundName] unsignedIntValue];
    if (!soundID)
    {
        CFURLRef url = (__bridge CFURLRef)([[NSBundle mainBundle] URLForResource:soundName withExtension:nil]);
        
        if (!url)
        {
            NSLog(@"url 为 nil");
            return;
        }
        
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        [_soundPlayers setObject:@(soundID) forKey:soundName];
    }
    
    AudioServicesPlayAlertSound(soundID);
//    AudioServicesPlaySystemSound(soundID);
}

@end
