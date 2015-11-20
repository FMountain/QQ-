# QQ-
仿写QQ音乐
# Contents
--
 + [简单的播放音效](#1)  
 + [播放音效封装成工具类](#2) 
 + [工具类的使用](#3)

--
## <a id ="1"></a>1.简单的播放音效
	//1.定义 ID
    SystemSoundID soundId = 0;
    
    //2.根据音效文件Url 给SystemSoundID 赋值
    CFURLRef url = (__bridge CFURLRef)([[NSBundle mainBundle] URLForResource:@"buyao.wav" withExtension:nil]);
    AudioServicesCreateSystemSoundID(url, &soundId);
    
    //3.播放音效
    AudioServicesPlaySystemSound(soundId);
    
## <a id ="2"></a>2. 播放音效封装成工具类
+ A3AudioTool.h
	+ + (void)playSoundWithSoundName:(NSString *)soundName;
+ A3AudioTool.m
			
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
		
		
## <a id = "3"></a> 3.工具类的使用
	+ //字典保存所有声音的ID 之后懒加载
	@property (nonatomic, assign) NSMutableDictionary *soundIds;
	//播放音效
	[A3AudioTool playSoundWithSoundName:@"buyao.wav"];
## <a></a>4.播放音乐工具类的使用
	//播放音乐
	+ (void)playMusicWithMusicName:(NSString *)musicName;
	//暂停音乐
	+ (void)pauseMusicWithMusicName:(NSString *)musicName;
	//停止音乐
	+ (void)stopMusicWithMusicName:(NSString *)musicName;
	-----------
	+.m播放音乐 
	 [A3AudioTool playMusicWithMusicName:@"120.mp3"];