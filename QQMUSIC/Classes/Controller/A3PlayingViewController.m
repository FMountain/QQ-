//
//  A3PlayingViewController.m
//  QQMUSIC
//
//  Created by mac on 15/12/9.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "A3PlayingViewController.h"

@interface A3PlayingViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *albumView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *songLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;

// 滑块
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

// 歌词的View
@property (weak, nonatomic) IBOutlet UIView *lrcView;

// 歌词的Label
@property (weak, nonatomic) IBOutlet UILabel *lrcLabel;

/** 进度的Timer */


/** 歌词更新的定时器 */
@property (nonatomic, strong) CADisplayLink *lrcTimer;

/** 当前的播放器 */


#pragma mark - slider的事件处理
- (IBAction)startSlide;
- (IBAction)sliderValueChange;
- (IBAction)endSlide;
- (IBAction)sliderClick:(UITapGestureRecognizer *)sender;

#pragma mark - 歌曲控制的事件处理
- (IBAction)playOrPause;
- (IBAction)previous;
- (IBAction)next;
@end

@implementation A3PlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startPlayingMusic];
}

#pragma mark - 开始播放音乐
- (void)startPlayingMusic
{

}

#pragma mark - slider的事件处理
- (IBAction)startSlide
{}
- (IBAction)sliderValueChange
{}
- (IBAction)endSlide
{}
- (IBAction)sliderClick:(UITapGestureRecognizer *)sender
{}

#pragma mark - 歌曲控制的事件处理
- (IBAction)playOrPause
{}
- (IBAction)previous
{}
- (IBAction)next
{}



@end
