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
static NSMutableDictionary  *_players;

+ (void)initialize
{
    _soundIDs = [NSMutableDictionary dictionary];
    _players  = [NSMutableDictionary dictionary];
}

//播放音效
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

//播放音乐
+ (void)playMusicWithMusicName:(NSString *)musicName
{
    //1.取出对应的播放器
    AVAudioPlayer *player = _players[musicName];
    
    //2.如果为nil,则创建播放器
    if ( player == nil) {
        //获取资源的URL
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        
        //根据url创建播放器
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        //将播放器保存到字典中
        [_players setObject:player forKey:musicName];
    }
    
    //3.播放音乐
    [player play];
}

//暂停音乐
+ (void)pauseMusicWithMusicName:(NSString *)musicName
{
    //取出对应的播放器
    AVAudioPlayer *player = _players[musicName];
    
    //2.判断是否为nil.,如果不为nil, 暂停音乐
    if (player) {
        [player pause];
    }
}

//停止音乐
+ (void)stopMusicWithMusicName:(NSString *)musicName
{
    //取出对应的播放器
    AVAudioPlayer *player = _players[musicName];
    
    //2.判断是否为nil.,如果不为nil, 停止音乐
    if (player) {
        [player stop];
        //清空
        [_players removeObjectForKey:musicName];
    }
}
@end
