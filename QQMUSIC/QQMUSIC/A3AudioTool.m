//
//  A3AudioTool.m
//  QQMUSIC
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 mac. All rights reserved.
/**
 *  播放音效 工具类
 */

#import "A3AudioTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation A3AudioTool

static NSMutableDictionary  *_soundIDs;
+ (void)initialie
{
    _soundIDs= [NSMutableDictionary dictionary];
}

+ (void)playSoundWithSoundName:(NSString *)soundName
{
    //1.取出对应的 SystemSoundID
    SystemSoundID soundID = [_soundIDs[soundName] unsignedIntValue];
    
    //2.如果之前没有保存过对应的 soundID ,取出则为0
    if (soundID == 0)
    {
        //根据 soundName 创建soundID
        //2.1 获取 soundName的路径
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        
        //2.2 给soundID赋值
        AudioServicesCreateSystemSoundID(url,&soundID);
        
        //2.3 将soundID保存到字典中
        [_soundIDs setObject:@(soundID) forKey:soundName];
    }
    
    //3.播放音效
    //    AudioServicesPlayAlertSound(soundID);//播放音效并震动
    AudioServicesPlaySystemSound(soundID);
}
@end
