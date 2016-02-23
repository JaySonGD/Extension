//
//  RecorderTools.m
//  25. 录音
//
//  Created by czljcb on 16/1/8.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "RecorderTools.h"

#import <AVFoundation/AVFoundation.h>
#define path @"users/czljcb/desktop/cz.caf"


@implementation RecorderTools

static AVAudioRecorder *_recorder = nil;


+ (void)initialize
{
    if (!_recorder)
    {
        NSDictionary *setting = @{
                                  AVEncoderAudioQualityKey  : [NSNumber numberWithInteger : AVAudioQualityLow],
                                  AVEncoderBitRateKey       : [NSNumber numberWithInteger:16],
                                  AVNumberOfChannelsKey     : [NSNumber numberWithInteger:2],
                                  AVFormatIDKey             : @(kAudioFormatLinearPCM),
                                  AVSampleRateKey           : [NSNumber numberWithFloat:8000.0]
                                  };
        
        NSURL *url = [NSURL fileURLWithPath:path];
        
        if (!url)
        {
            NSLog(@"url 为 nil");
            return;
        }
        
        _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:setting error:NULL];
        
        [_recorder prepareToRecord];
    }
}

+ (void)startRecorder
{
    if (_recorder)
    {
        [_recorder record];
    }
    else
    {
        NSLog(@"recorder 初次化出错");
    }
    
}

+ (void)stopRecorder
{
    if (_recorder)
    {
        [_recorder stop];
    }
    else
    {
        NSLog(@"recorder 初次化出错");
    }
}

@end
