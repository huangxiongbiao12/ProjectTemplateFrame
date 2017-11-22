//
//  NSDate+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "NSDate+BG_Tool.h"

@implementation NSDate (BG_Tool)

//时间戳转时间
+(NSDate*)dateFromInterger:(NSInteger)longDate
{
    return [self dateWithTimeIntervalSince1970:longDate];
}
//时间转时间戳
+(NSInteger)longFromDate:(NSDate*)date
{
    return [date timeIntervalSince1970];
}

/*计算这个月有多少天*/
- (NSUInteger)numberOfDaysInCurrentMonth
{
    
    // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}


//获取这个月有多少周
- (NSUInteger)numberOfWeeksInCurrentMonth
{
    NSUInteger weekday = [[self firstDayOfCurrentMonth] weeklyOrdinality];
    NSUInteger days = [self numberOfDaysInCurrentMonth];
    NSUInteger weeks = 0;
    
    if (weekday > 1) {
        weeks += 1, days -= (7 - weekday + 1);
    }
    
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    
    return weeks;
}



/*计算这个月的第一天是礼拜几*/
- (NSUInteger)weeklyOrdinality
{
    //    NSCalendarUnitWeekdayOrdinal
    //    kCFCalendarUnitWeek
    //#warning -----
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:self];
}



//计算这个月最开始的一天
- (NSDate *)firstDayOfCurrentMonth
{
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:NULL forDate:self];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}


- (NSDate *)lastDayOfCurrentMonth
{
    NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:calendarUnit fromDate:self];
    dateComponents.day = [self numberOfDaysInCurrentMonth];
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

//一个月前
- (NSDate *)dayInThePreviousMonth
{
    return [self dayInTheFollowingMonth:-1];
}

//一个月后
- (NSDate *)dayInTheFollowingMonth
{
    return [self dayInTheFollowingMonth:1];
}


//获取当前日期之后的几个月
- (NSDate *)dayInTheFollowingMonth:(NSInteger)month
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = month;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

//获取当前日期之后的几个天
- (NSDate *)dayInTheFollowingDay:(NSInteger)day
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = day;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

//获取当前日期之后的几分钟之后
- (NSDate *)dayInTheFollowingMinute:(NSInteger)minute
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.minute = minute;
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

//获取年月日对象
- (NSDateComponents *)YMDComponents
{
    
    return [[NSCalendar currentCalendar] components:
            NSCalendarUnitYear|
            NSCalendarUnitMonth|
            NSCalendarUnitDay|
            NSCalendarUnitWeekday|NSCalendarUnitCalendar fromDate:self];
    
}

#pragma mark-------
//-----------------------------------------
/** NSString转NSDate===(formate yyyy-MM-dd/yyyy-MM-dd HH:mm:ss)
 *  自己设置格式转换
 */
+(NSDate *)dateFromString:(NSString *)dateString formate:(NSString *)formate {
    if (!formate.length) {
        formate = @"yyyy-MM-dd";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

//
//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)dateString
{
    return [self dateFromString:dateString formate:@"yyyy-MM-dd"];
}
//NSString转NSDate(时分秒)
+ (NSDate *)dateHDSFromString:(NSString *)dateString
{
    return [self dateFromString:dateString formate:@"yyyy-MM-dd HH:mm:ss"];
}

+(NSString *)stringFromDate:(NSDate *)date formate:(NSString *)formate {
    
    if (!formate.length) {
        formate = @"yyyy-MM-dd";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    //    format @"yyyy-MM-dd HH:mm:ss zzz";
    [dateFormatter setDateFormat:formate];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date
{
    return [self stringFromDate:date formate:@"yyyy-MM-dd"];
}

//NSDate转NSString(时分秒)
+ (NSString *)stringHDSFromDate:(NSDate *)date
{
    return [self stringFromDate:date formate:@"yyyy-MM-dd HH:mm:ss"];
}

#pragma mark-------

+ (NSInteger)getDayNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//日历控件对象
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:today toDate:beforday options:0];
    NSInteger day = [components day];//两个日历之间相差多少月
    return day;
}

+ (NSInteger)getMonthNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//日历控件对象
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth|NSCalendarUnitDay fromDate:today toDate:beforday options:0];
    NSInteger day = [components month];//两个日历之间相差多少月
    return day;
}


//周日是“1”，周一是“2”...
-(NSInteger)getWeekIntValueWithDate
{
    NSInteger weekIntValue;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *comps= [calendar components:(NSCalendarUnitYear |
                                                   NSCalendarUnitMonth |
                                                   NSCalendarUnitDay |
                                                   NSCalendarUnitWeekday) fromDate:self];
    return weekIntValue = [comps weekday];
}


-(BOOL)isBetweenFromStartDate:(NSDate *)startDate toEndDate:(NSDate *)endDate
{
    if ([[self laterDate:startDate] isEqualToDate:self]&&[[self earlierDate:endDate] isEqualToDate:self]) {
        return NO;
    }
    return YES;
    
}


//判断日期是今天,明天,后天,周几
-(NSString *)compareIfTodayWithDate
{
    NSDate *todate = [NSDate date];//今天
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *comps_today= [calendar components:(NSCalendarUnitYear |
                                                         NSCalendarUnitMonth |
                                                         NSCalendarUnitDay |
                                                         NSCalendarUnitWeekday) fromDate:todate];
    
    
    NSDateComponents *comps_other= [calendar components:(NSCalendarUnitYear |
                                                         NSCalendarUnitMonth |
                                                         NSCalendarUnitDay |
                                                         NSCalendarUnitWeekday) fromDate:self];
    
    
    //获取星期对应的数字
    NSInteger weekIntValue = [self getWeekIntValueWithDate];
    
    if (comps_today.year == comps_other.year &&
        comps_today.month == comps_other.month &&
        comps_today.day == comps_other.day) {
        return @"今天";
        
    }else if (comps_today.year == comps_other.year &&
              comps_today.month == comps_other.month &&
              (comps_today.day - comps_other.day) == -1){
        return @"明天";
        
    }else if (comps_today.year == comps_other.year &&
              comps_today.month == comps_other.month &&
              (comps_today.day - comps_other.day) == -2){
        return @"后天";
        
    }else{
        //直接返回当时日期的字符串(这里让它返回空)
        return [NSDate getWeekStringFromInteger:weekIntValue];//周几
    }
}



//通过数字返回星期几
+(NSString *)getWeekStringFromInteger:(NSInteger)week
{
    NSString *str_week;
    
    switch (week) {
        case 1:
            str_week = @"周日";
            break;
        case 2:
            str_week = @"周一";
            break;
        case 3:
            str_week = @"周二";
            break;
        case 4:
            str_week = @"周三";
            break;
        case 5:
            str_week = @"周四";
            break;
        case 6:
            str_week = @"周五";
            break;
        case 7:
            str_week = @"周六";
            break;
    }
    return str_week;
}


@end
