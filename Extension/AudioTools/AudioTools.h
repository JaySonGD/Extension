//
//  AudioTools.h
//  25. 播放音乐
//
//  Created by czljcb on 16/1/8.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AVAudioPlayer;
@interface AudioTools : NSObject

+ (AVAudioPlayer *)playMusicWithmusicName:(NSString *)musicName;


+ (void)stopMusicWithmusicName:(NSString *)musicName;

+ (void)pauseMusicWithmusicName:(NSString *)musicName;

+ (void)playSoundWithSoundName:(NSString *)soundName;
@end
