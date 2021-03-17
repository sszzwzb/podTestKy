//
//  Utilities.h
//  CarHome
//
//  Created by kaiyi on 2017/12/19.
//  Copyright © 2017年 kaiyi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, timeWithTimeIntervalStringENUM) {
    timeWithTimeIntervalString_HHmm = 0,  //  时分，24小时制    08:30
    timeWithTimeIntervalString_yyyyMMddHHmm,  //  时分，24小时制    2018.02.02 08:30
    timeWithTimeIntervalString_yyyyMMddHHmmss,  //  时分，24小时制    2020-11-25 13:47:21
};



@interface Utilities : NSObject


// 无网络连接通用
+ (UIView*)showNoNetworkView:(NSString*)msg msg2:(NSString*)msg2 andRect:(CGRect)rect;


//  飞机列表页没有数据显示
+ (UIView*)showNoListView:(NSString*)msg msg2:(NSString*)msg2 andRect:(CGRect)rect;

+ (void)showNoListView:(NSString*)msg msg2:(NSString*)msg2 descView:(UIView *)descV isShow:(BOOL)isShow;


//  最后7个变红
+(NSAttributedString *)last7_RedWithString:(NSString *)string;


//  去掉服务器返回结果文本中的<null>  数组
+ (NSArray *)replaceArrNull:(NSArray *)arr;

// 去掉服务器返回结果文本中的<null>
+ (NSString *)replaceNull:(NSString *)source;
// 去掉特殊东西
+ (NSDictionary *)replaceDicNull:(NSDictionary *)dic;


// 获取查找字符串在母串中的NSRange
+ (NSDictionary *)rangesOfString:(NSString *)searchString inString:(NSString *)str;

//  转json
+(NSString *)objectToJsonWithObject:(NSObject *)object;

//  转json str，去掉格式的str
+(NSString *)objectToJsonStringWithObject:(NSObject *)object;

// 将JSON字符串转化为字典或者数组
+ (id)JsonStrtoArrayOrNSDictionary:(id)jsonData;

//将string字符串转换为array数组
+(NSArray *)strChangeArrWithStr:(NSString *)str;

//将array数组转换为string字符串
+(NSString *)arrChangestrWithArr:(NSArray *)array;



//  Linux时间戳
//字符串转时间戳 如：  @"YYYY-MM-dd HH:mm:ss"
+ (NSString *)getTimeStrWithString:(NSString *)str;

//  NSDate时间转时间戳
+ (NSString *)getCurrentTimeStampWithNsDate:(NSDate *)date;

//  当前时间的时间戳
+ (NSString *)getCurrentTimeStampStr;

//  时间戳转字符串
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString state:(timeWithTimeIntervalStringENUM)state;


//   需要打开WiFi相关信息（Access WiFi Information），还要在申请证书的时候，获取WiFi名称   iOS 13需要打开地理位置才能获取到WIFi信息
+ (NSString *)wifiName;
//   需要添加WiFi相关信息，获取WiFi MAC 地址
+ (NSString *)wifiMac;

//   zhongYingIM://%7B%22share%22:%22zhangkaiyi%22%7D  解码  zhongYingIM://{"share":"zhangkaiyi"}
+ (NSString *)urlDecodeStringWithStr:(NSString *)str;


/**
 * @method
 *
 * @brief 根据路径获取视频时长和大小
 * @param path       视频路径
 * @return    字典    @"size"－－文件大小   @"duration"－－视频时长
 */
+ (NSDictionary *)getVideoInfoWithSourcePath:(NSString *)path;

//   UIlable,自适应宽度
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

//   UIlable,自适应高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;




/**
 图片压缩
 maxLength ： 300kb  传 300 * 1024  比实际大小小
 */
+ (NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;


//  查看地理位置权限
+ (BOOL)haveMapPermissions;

//   电话号码
+ (BOOL)isValidPhoneNumber:(NSString *)mobile;
//   邮箱格式
+ (BOOL)isValidEmailNumber:(NSString *)emali;
//   身份证判断
+ (BOOL)checkUserIdCard: (NSString*) idCard;
//   输出链接，有问题
+(NSArray *)checkToLink:(NSString *)string;

//获得设备型号
+(NSString *)getCurrentDeviceModel;

//   金额格式转换  12345 转成 12,234.00
+ (NSString *)stringChangeMoneyWithDoubleStr:(NSString *)numberStr;

//  汉字转拼音
+ (NSString *) pinyinFirstLetter:(NSString*)sourceString;

/**
 画虚线 isHorizonal = YES 为横线
 */
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;


@end
