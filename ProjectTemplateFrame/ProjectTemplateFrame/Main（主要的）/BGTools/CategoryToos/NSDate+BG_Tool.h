//
//  NSDate+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BG_Tool)

/*计算这个月有多少天*/
- (NSUInteger)numberOfDaysInCurrentMonth;

/*获取这个月有多少周*/
- (NSUInteger)numberOfWeeksInCurrentMonth;

/*计算这个月的第一天是礼拜几*/
- (NSUInteger)weeklyOrdinality;

/*当前月第一天的日期*/
- (NSDate *)firstDayOfCurrentMonth;

/*当前月最后一天的日期*/
- (NSDate *)lastDayOfCurrentMonth;

/*获取年月日对象*/
- (NSDateComponents *)YMDComponents;

#pragma mark===============字符串日期互转==================

/** NSString转NSDate===(formate yyyy-MM-dd/yyyy-MM-dd HH:mm:ss)
 *  自己设置格式转换
 */
+ (NSDate *)dateFromString:(NSString *)dateString formate:(NSString*)formate;

/*NSString转NSDate===yyyy-MM-dd*/
+ (NSDate *)dateFromString:(NSString *)dateString;

/*NSString转NSDate(时分秒)===yyyy-MM-dd HH:mm:ss*/
+ (NSDate *)dateHDSFromString:(NSString *)dateString;

//===========
/** NSString转NSDate===(formate yyyy-MM-dd/yyyy-MM-dd HH:mm:ss)
 *  自己设置格式转换
 */
+ (NSString *)stringFromDate:(NSDate *)date formate:(NSString*)formate;
;

/*NSDate转NSString====yyyy-MM-dd*/
+ (NSString *)stringFromDate:(NSDate *)date;

/*NSDate转NSString(时分秒)==yyyy-MM-dd HH:mm:ss*/
+ (NSString *)stringHDSFromDate:(NSDate *)date;

/*时间戳转时间*/
+(NSDate*)dateFromInterger:(NSInteger)longDate;

/*时间转时间戳*/
+(NSInteger)longFromDate:(NSDate*)date;

#pragma mark===============两日期比较==================

/*一个月前的日期*/
- (NSDate *)dayInThePreviousMonth;

/*一个月后的日期*/
- (NSDate *)dayInTheFollowingMonth;

/*获取当前日期几个月之后的日期*/
- (NSDate *)dayInTheFollowingMonth:(NSInteger)month;

/*获取当前日期几天之后的日期*/
- (NSDate *)dayInTheFollowingDay:(NSInteger)day;

/*返回两个日期相差几天*/
+ (NSInteger)getDayNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday;

/*返回两个日期相差几月*/
+ (NSInteger)getMonthNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday;

/*判断日期是否在某段时间之内*/
- (BOOL)isBetweenFromStartDate:(NSDate*)startDate toEndDate:(NSDate*)endDate;

/*获取当前日期是周几 (周日是“1”，周一是“2”...)*/
-(NSInteger)getWeekIntValueWithDate;

/*通过数字返回星期几*/
+(NSString *)getWeekStringFromInteger:(NSInteger)week;

/*返回 今天,明天,后天,周几*/
-(NSString *)compareIfTodayWithDate;


@end
