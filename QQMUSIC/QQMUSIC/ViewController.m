//
//  ViewController.m
//  QQMUSIC
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "A3AudioTool.h"

@interface ViewController ()
/** 字典保存所有声音的ID 之后懒加载 */
@property (nonatomic, assign) NSMutableDictionary *soundIds;
@end

@implementation ViewController
#pragma mark - lazy
- (NSMutableDictionary *)soundIds
{
    if (_soundIds == nil) {
        _soundIds = [NSMutableDictionary dictionary];
    }
    return _soundIds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickBtn:(UIButton *)sender {
    [A3AudioTool playSoundWithSoundName:@"buyao.wav"];
}
- (IBAction)dawangClickBtn:(UIButton *)sender {
    [A3AudioTool playSoundWithSoundName:@"dawang.wav"];
}


@end
