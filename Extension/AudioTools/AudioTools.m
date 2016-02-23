//
//  AudioTools.m
//  25. 播放音乐
//
//  Created by czljcb on 16/1/8.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "AudioTools.h"
#import <AVFoundation/AVFoundation.h>



@implementation AudioTools

static  NSMutableDictionary *_soundPlayers;
static  NSMutableDictionary *_players;

+(void)initialize
{
    _players = [NSMutableDictionary dictionary];
    _soundPlayers = [NSMutableDictionary dictionary];
}

+ (AVAudioPlayer *)playMusicWithmusicName:(NSString *)musicName
{
    AVAudioPlayer *player = _players[musicName];
    
    if (player == nil)
    {
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        
        if (url == nil)
        {
            NSLog(@"musicName 有误");
            return nil;
        }
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
        [_players setObject:player forKey:musicName];
        [player prepareToPlay];
        
    }
    
    [player play];
    
    return player;
    
    
    
}


+ (void)stopMusicWithmusicName:(NSString *)musicName
{
    AVAudioPlayer *player = _players[musicName];
    
    if (player)
    {
        [player stop];
    }
    else
    {
        NSLog(@"不存在 player");
    }
    
}

+ (void)pauseMusicWithmusicName:(NSString *)musicName
{
    AVAudioPlayer *player = _players[musicName];
    
    if (player)
    {
        [player pause];
    }
    else
    {
        NSLog(@"不存在 player");
    }
    
}


+ (void)playSoundWithSoundName:(NSString *)soundName // 音效
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
