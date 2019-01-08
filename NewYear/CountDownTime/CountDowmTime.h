//
//  CountDowmTime.h
//  NewYear
//
//  Created by 贾倍 on 2019/1/8.
//  Copyright © 2019 贾倍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountDowmTime : NSObject


/**
 使用NSDate日期倒计时

 @param startDate 开始时间
 @param finishDate 结束时间
 @param completeBlock 天时分秒
 */
-(void)countDownWithStratDate:(NSDate *)startDate finishDate:(NSDate *)finishDate completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;


/**
 使用时间戳的倒计时

 @param starTimeStamp 开始时间
 @param finishTimeStamp 结束时间
 @param completeBlock 天时分秒
 */
-(void)countDownWithStratTimeStamp:(long long)starTimeStamp finishTimeStamp:(long long)finishTimeStamp completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;

-(void)countDownWithPER_SECBlock:(void (^)(void))PER_SECBlock;
-(void)destoryTimer;
-(NSDate *)dateWithLongLong:(long long)longlongValue;

@end

NS_ASSUME_NONNULL_END
