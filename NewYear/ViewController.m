//
//  ViewController.m
//  NewYear
//
//  Created by 贾倍 on 2019/1/8.
//  Copyright © 2019 贾倍. All rights reserved.
//



#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CountDownTime/CountDowmTime.h"
#import "Header.h"

@interface ViewController ()

@property(nonatomic,strong)AVAudioPlayer *audioPlayer;
@property(nonatomic,strong)UIImageView *backImageV;

@property(nonatomic,retain) dispatch_source_t timer;
@property(nonatomic,retain) NSDateFormatter *dateFormatter;

@property(nonatomic,strong)CountDowmTime *countDown;
@property(nonatomic,strong)UILabel *textStr;
@property(nonatomic,strong)UILabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"春节序曲.mp3" withExtension:nil];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.audioPlayer.numberOfLoops = 1;
    [self.audioPlayer play];
    
    self.backImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.backImageV.image = [UIImage imageNamed:@"1543311752631.jpg"];
    [self.view addSubview:self.backImageV];
    
    self.textStr = [[UILabel alloc] initWithFrame:CGRectMake(10, StatusH, kMainScreen_width-20, 44)];
    self.textStr.text = @"距离春节还有";
    self.textStr.textColor = [UIColor whiteColor];
    self.textStr.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textStr];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, StatusH+44, kMainScreen_width-20, 44)];
    //    timeLabel.backgroundColor = [UIColor redColor];
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.timeLabel];
    
    self.countDown = [[CountDowmTime alloc] init];
    __weak __typeof(self) weakSelf= self;
    [self.countDown countDownWithPER_SECBlock:^{
        weakSelf.timeLabel.text = [self getNowTimeWithString:@"2019-02-04 23:59:59"];
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSString *)getNowTimeWithString:(NSString *)aTimeString{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    hoursStr = [NSString stringWithFormat:@"%d",hours];
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0) {
        self.textStr.hidden = YES;
        self.backImageV.image = [UIImage imageNamed:@"20190205.jpg"];
        [self.audioPlayer stop];
        return self.timeLabel.text = @"春节快乐";
    }
    if (days) {
        return [NSString stringWithFormat:@"%@天 %@小时 %@分 %@秒", dayStr,hoursStr, minutesStr,secondsStr];
    }
    return [NSString stringWithFormat:@"%@小时 %@分 %@秒",hoursStr , minutesStr,secondsStr];
}

-(void)dealloc{
    NSLog(@"%s dealloc",object_getClassName(self));
}


@end
