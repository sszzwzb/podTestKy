//
//  Utilities.m
//  CarHome
//
//  Created by kaiyi on 2017/12/19.
//  Copyright © 2017年 kaiyi. All rights reserved.
//

#import "Utilities.h"

#import <AVFoundation/AVFoundation.h>


//  判断手机型号
//1.引入utsname文件
#import <sys/utsname.h>



//  获取 WiFi MAC 地址
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h>

//   位置权限
#import <CoreLocation/CoreLocation.h>


#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)



@implementation Utilities


// 无网络连接通用
+(UIView*)showNoNetworkView:(NSString*)msg msg2:(NSString*)msg2 andRect:(CGRect)rect
{
    
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    float start = (rect.size.height - 110.0)/3.0;
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width- 110.0)/2.0, start, 110.0, 110.0)];
    imgV.image = [UIImage imageNamed:@"icon_noNetworkImg"];
    [view addSubview:imgV];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imgV.frame.origin.y+imgV.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, 20)];
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:15.0];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height, [UIScreen mainScreen].bounds.size.width, 20)];
    label2.numberOfLines = 2;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = msg2;
    label2.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
    label2.font = [UIFont systemFontOfSize:15.0];
    
    [view addSubview:label];
    [view addSubview:label2];
    
    return view;
    
}

//  飞机列表页没有数据显示
+ (UIView*)showNoListView:(NSString*)msg msg2:(NSString*)msg2 andRect:(CGRect)rect
{
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    float start = (rect.size.height - 110.0)/3.0;
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width- 110.0)/2.0, start, 110.0, 110.0)];
    imgV.image = [UIImage imageNamed:@"icon_noNoListImg"];
    [view addSubview:imgV];
    
    if ([[Utilities replaceNull:msg] isEqualToString:@""]) {
        msg = @"暂时没有新消息哦~";
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imgV.frame.origin.y+imgV.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, 20)];
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:15.0];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height, [UIScreen mainScreen].bounds.size.width, 20)];
    label2.numberOfLines = 2;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = msg2;
    label2.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
    label2.font = [UIFont systemFontOfSize:15.0];
    
    [view addSubview:label];
    [view addSubview:label2];
    
    return view;
}


+ (void)showNoListView:(NSString*)msg msg2:(NSString*)msg2 descView:(UIView *)descV isShow:(BOOL)isShow
{
    
    if (descV == nil) descV = [UIApplication sharedApplication].keyWindow;
    
    UIView *view = [descV viewWithTag:30000];
    
    if (isShow == YES) {
        
        if (!view) {
           
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(descV.frame), CGRectGetHeight(descV.frame))];
            view.backgroundColor = [UIColor whiteColor];
            view.tag = 30000;
            [descV addSubview:view];
            
            float start = (descV.bounds.size.height - 110.0)/3.0;
            UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width- 110.0)/2.0, start, 110.0, 110.0)];
            imgV.image = [UIImage imageNamed:@"icon_noNoListImg"];
            [view addSubview:imgV];
            
            if ([[Utilities replaceNull:msg] isEqualToString:@""]) {
                msg = @"暂时没有新消息哦~";
            }
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imgV.frame.origin.y+imgV.frame.size.height+5, [UIScreen mainScreen].bounds.size.width, 20)];
            label.numberOfLines = 2;
            label.textAlignment = NSTextAlignmentCenter;
            label.text = msg;
            label.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
            label.font = [UIFont systemFontOfSize:15.0];
            
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label.frame.origin.y+label.frame.size.height, [UIScreen mainScreen].bounds.size.width, 20)];
            label2.numberOfLines = 2;
            label2.textAlignment = NSTextAlignmentCenter;
            label2.text = msg2;
            label2.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
            label2.font = [UIFont systemFontOfSize:15.0];
            
            [view addSubview:label];
            [view addSubview:label2];
        }
    } else {
        
        if (view) {
            [view removeFromSuperview];
        }
    }
}

//   最后 7个子变成红色
+(NSAttributedString *)last7_RedWithString:(NSString *)string{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger temp = [str length];
    
    if (temp >= 7) {
        //   改变颜色
        [str addAttribute:NSForegroundColorAttributeName
                    value:[UIColor redColor]
                    range:NSMakeRange(temp - 7,7)];
    }
    
    //    [str addAttribute:NSFontAttributeName
    //                value:[UIFont fontWithName:@"Arial" size:13.f]
    //                range:NSMakeRange(temp - 1,1)];
    return str;
}

/*
 * 去掉服务器返回结果文本中的<null>
 */
+ (NSString *)replaceNull:(NSString *)source
{
    NSString *result = [NSString stringWithFormat:@"%@", source];
    if (result != nil && (NSNull *)result != [NSNull null]) {
        if ([result isEqualToString:@"<null>"]) {
            return @"";
        } else if ([result isEqualToString:@"(null)"]) {
            return @"";
        } else {
            return result;
        }
    } else {
        return @"";
    }
}

/*
 * 去掉服务器返回结果文本中的<null>  数组
 */
+ (NSArray *)replaceArrNull:(NSArray *)arr
{
    if (arr != nil && ![arr isKindOfClass:[NSNull class]] && arr.count != 0
        && ([arr isKindOfClass:[NSArray class]] || [arr isKindOfClass:[NSMutableArray class]])){
        return arr;
    } else {
        return @[];
    }
}

+ (NSDictionary *)replaceDicNull:(NSDictionary *)dic
{
    if (dic != nil && ![dic isKindOfClass:[NSNull class]] && dic.allKeys.count != 0
        && ([dic isKindOfClass:[NSDictionary class]] || [dic isKindOfClass:[NSMutableDictionary class]])){
        return dic;
    } else {
        return @{};
    }
}

//  转json
+(NSString *)objectToJsonWithObject:(NSObject *)object
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


//  转json str，去掉格式的str
+(NSString *)objectToJsonStringWithObject:(NSObject *)object
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n"withString:@""];
    
    return str;
}

// 将JSON串转化为字典或者数组
+ (id)JsonStrtoArrayOrNSDictionary:(id)jsonData{
    NSData *data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}


//将string字符串转换为array数组
+(NSArray *)strChangeArrWithStr:(NSString *)str
{
    if ([[Utilities replaceNull:str] isEqualToString:@""]) return [NSArray array];
    return [str componentsSeparatedByString:@","]; // --分隔符
}


//将array数组转换为string字符串
+(NSString *)arrChangestrWithArr:(NSArray *)array
{
    return [array componentsJoinedByString:@","]; //  --分隔符
}



//字符串转时间戳 如：2017-4-10 17:15:10
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];//字符串转成时间戳,精确到秒
    return timeStr;
}


//  NSDate时间转时间戳
+ (NSString *)getCurrentTimeStampWithNsDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = date;//现在时间
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    
    return [NSString stringWithFormat:@"%ld",timeSp];
}

//  当前时间的时间戳
+ (NSString *)getCurrentTimeStampStr
{
    return [Utilities getCurrentTimeStampWithNsDate:[NSDate date]];
}

//  时间戳转字符串
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString state:(timeWithTimeIntervalStringENUM)state
{
    NSString *dateFormatState = @"yyyy年MM月dd日 HH:mm";
    if (state == timeWithTimeIntervalString_yyyyMMddHHmm) {
        dateFormatState = @"yyyy.MM.dd HH:mm";
    } else if (state == timeWithTimeIntervalString_HHmm) {
        dateFormatState = @"HH:mm";
    } else if (state == timeWithTimeIntervalString_yyyyMMddHHmmss) {
        dateFormatState = @"yyyy-MM-dd HH:mm:ss";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatState];
    
    // 如果毫秒值转化为秒  需要除以1000
    if ([timeString length] == 0) {
        return @"";
    } else if ([timeString length] == 10) {
        
    } else if ([timeString length] == 13) {
        timeString = [timeString substringToIndex:10];
    }
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}




//   需要打开WiFi相关信息（Access WiFi Information），还要在申请证书的时候，获取WiFi名称  iOS 13需要打开地理位置才能获取到WIFi信息
+ (NSString *)wifiName
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dic = (NSDictionary *)info;
    NSString *ssid = [[dic objectForKey:@"SSID"] lowercaseString];
    
    return ssid;
}

//   需要添加WiFi相关信息，获取WiFi MAC 地址
+ (NSString *)wifiMac
{
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef) ifname);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dic = (NSDictionary *)info;
    NSString *bssid = [dic objectForKey:@"BSSID"];
    
    
    //  整理格式，"7c:a1:77:9e:6:60  整理成 "7c:a1:77:9e:06:60
    NSMutableArray *bssidArr = [NSMutableArray array];
    for (NSString *perStr in [bssid componentsSeparatedByString:@":"]) {
        NSString *test = perStr;
        if ([test length] == 1) {
            test = [@"0" stringByAppendingString:perStr];
        }
        if ([test length] == 0) {
            test = @"00";
        }
        [bssidArr addObject:test];
    }
    
    
    return [bssidArr count] > 0 ? [bssidArr componentsJoinedByString:@":"] : @"";
}



// 获取本地视频数据
+ (NSDictionary *)getVideoInfoWithSourcePath:(NSString *)path{
    AVURLAsset * asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:path]];
    CMTime   time = [asset duration];
    int seconds = ceil(time.value/time.timescale);
    
    NSInteger fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    
    return @{@"size" : @(fileSize),
             @"duration" : @(seconds)};
}

//   UIlable,自适应宽度
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

//   UIlable,自适应高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}


//  图片压缩
+ (NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    
    NSLog(@"压缩前的大小：%fKB",data.length/1024.0);
    
    if (data.length < maxLength) return data;

    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    
    NSLog(@"压缩 1 的大小：%fKB",data.length/1024.0);
    if (data.length < maxLength) return data;

    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    NSLog(@"压缩 2 的大小：%fKB",data.length/1024.0);
    
    return data;
}

+ (BOOL)haveMapPermissions
{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)) {
        return YES;
    } else {
        return NO;
    }
}

//   判断手机格式
+ (BOOL)isValidPhoneNumber:(NSString *)mobile {
    NSString *regex = @"^1[0-9]{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL)isValidEmailNumber:(NSString *)emali {
    NSString *regex = @"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [phoneTest evaluateWithObject:emali];
}

#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString*) idCard
{
    NSString *pattern =@"(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}


//  有问题
+(NSArray *)checkToLink:(NSString *)string
{
    NSError *error;
    //可以识别url的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z0-9]{1,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
//    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    //NSString *subStr;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSMutableArray *rangeArr=[[NSMutableArray alloc]init];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch;
        substringForMatch = [string substringWithRange:match.range];
        [arr addObject:substringForMatch];
        
    }
    NSSet *set = [NSSet setWithArray:arr];
    arr = [NSMutableArray arrayWithArray:[set allObjects]];
    NSString *subStr=string;
    for (NSString *str in arr)
    {
        [self rangesOfString:str inString:subStr];
        [rangeArr addObject:[self rangesOfString:str inString:subStr]];
        
    }
    
    NSLog(@"判断 = %@ \n%@  %@", string, arr, rangeArr);
    return [Utilities replaceArrNull:arr];
}

//获取查找字符串在母串中的NSRange
+ (NSDictionary *)rangesOfString:(NSString *)searchString inString:(NSString *)str {
    NSMutableArray *results = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, [str length]);
    NSRange range;
    while ((range = [str rangeOfString:searchString options:0 range:searchRange]).location != NSNotFound) {
        [results addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range), [str length] - NSMaxRange(range));
    }
    NSDictionary *dic = @{@"array":results,@"url":searchString};
    return dic;
}

//获得设备型号
+(NSString *)getCurrentDeviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    //add by lyp
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7Plus";
    //add by kaiyi
    if ([platform isEqualToString:@"iPhone10,1"])   return @"(A1863)(A1906)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"(Global/A1905)iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"(A1864)(A1898)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"(Global/A1897)iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"(A1865)(A1902)iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"(Global/A1901)iPhone X";
    
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
    
    //    //手机别名： 用户定义的名称
    //    NSString* userPhoneName = [[UIDevice currentDevice] name];
    //    NSLog(@"手机别名: %@", userPhoneName);
    //    //设备名称
    //    NSString* deviceName = [[UIDevice currentDevice] systemName];
    //    NSLog(@"设备名称: %@",deviceName );
    //    //手机系统版本
    //    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    //    NSLog(@"手机系统版本: %@", phoneVersion);
    //    //手机型号
    //    NSString* phoneModel = [[UIDevice currentDevice] model];
    //    NSLog(@"手机型号: %@",phoneModel );
    //    //地方型号  （国际化区域名称）
    //    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    //    NSLog(@"国际化区域名称: %@",localPhoneModel );
    //
    //    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //    // 当前应用名称
    //    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    //    NSLog(@"当前应用名称：%@",appCurName);
    //    // 当前应用软件版本  比如：1.0.1
    //    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //    NSLog(@"当前应用软件版本:%@",appCurVersion);
    //    // 当前应用版本号码   int类型
    //    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    //    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
    //
    //
    //    NSString *device = [Utilities getCurrentDeviceModel:self.viewController];
    //    NSLog(@"device：%@",device);
    
}

//   金额格式转换  12345 转成 12,234.00
+ (NSString *)stringChangeMoneyWithDoubleStr:(NSString *)numberStr {
    if (!numberStr || numberStr.length == 0) {
        return numberStr;
    }
    
    NSNumber *number = @([numberStr doubleValue]);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.positiveFormat = @"###,##0.00";
    
    NSString *amountString = [formatter stringFromNumber:number];
    return amountString;
}

//  汉字转拼音
+ (NSString *) pinyinFirstLetter:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);//这一行是去声调的
//    source = [source length] > 0 ? [source substringToIndex:1] : source;   只留首字母
    return source;
}


//  画虚线 isHorizonal = YES 横线
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    //  删除线的方法
//    [shapeLayer removeFromSuperlayer];
    
    [shapeLayer setBounds:lineView.bounds];
    
    if (isHorizonal) {
        
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
        
    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame)/2)];
    }
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {
        
        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [lineView.layer addSublayer:shapeLayer];
}

@end
