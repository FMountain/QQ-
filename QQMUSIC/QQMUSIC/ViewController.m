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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)playClickBtn:(id)sender {
    [A3AudioTool playMusicWithMusicName:@"120.mp3"];

}

- (IBAction)dawangClickBtn:(UIButton *)sender {
    [A3AudioTool pauseMusicWithMusicName:@"120.mp3"];

    
}

- (IBAction)stopClickBtn:(UIButton *)sender {
    [A3AudioTool stopMusicWithMusicName:@"120.mp3"];
}


@end
