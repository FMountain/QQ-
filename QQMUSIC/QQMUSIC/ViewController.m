//
//  ViewController.m
//  QQMUSIC
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickBtn:(UIButton *)sender {
    
    //1.定义 ID
    SystemSoundID soundId = 0;
    
    //2.根据音效文件Url 给SystemSoundID 赋值
    CFURLRef url = (__bridge CFURLRef)([[NSBundle mainBundle] URLForResource:@"buyao.wav" withExtension:nil]);
    AudioServicesCreateSystemSoundID(url, &soundId);
    
    //3.播放音效
    AudioServicesPlaySystemSound(soundId);
}


@end
