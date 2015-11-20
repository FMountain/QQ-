//
//  A3AudioTool.h
//  QQMUSIC
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 mac. All rights reserved.
/**
 *  播放音效 工具类
 */

#import <Foundation/Foundation.h>

@interface A3AudioTool : NSObject

//播放音效
+ (void)playSoundWithSoundName:(NSString *)soundName;

//播放音乐
+ (void)playMusicWithMusicName:(NSString *)musicName;
//暂停音乐
+ (void)pauseMusicWithMusicName:(NSString *)musicName;
//停止音乐
+ (void)stopMusicWithMusicName:(NSString *)musicName;
@end
