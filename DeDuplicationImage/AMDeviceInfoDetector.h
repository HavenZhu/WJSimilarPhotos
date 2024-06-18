//
//  AMDeviceInfoDetector.h
//  DeDuplicationImage
//
//  Created by Zhu Ning on 2024/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMDeviceInfoDetector : NSObject

// 当前使用的内存，单位MB
+ (CGFloat)currentMemoryUsed;

// 总内存，单位MB
+ (CGFloat)deviceTotalMemory;

// 当前可用内存，单位MB
+ (CGFloat)currentAvailableMemory;

// 总磁盘，单位MB
+ (CGFloat)deviceTotalDisk;

// 当前使用的磁盘，单位MB
+ (CGFloat)currentAvailableDisk;

@end

NS_ASSUME_NONNULL_END
