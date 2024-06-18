//
//  AMDeviceInfoDetector.m
//  DeDuplicationImage
//
//  Created by Zhu Ning on 2024/6/18.
//

#import "AMDeviceInfoDetector.h"
#import <mach/mach.h>

@implementation AMDeviceInfoDetector

+ (CGFloat)currentMemoryUsed {
    CGFloat memoryUsed = 0.0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if (kernelReturn == KERN_SUCCESS) {
        memoryUsed = (CGFloat) vmInfo.phys_footprint / 1024.f / 1024.f;
    }
    return memoryUsed;
}

+ (CGFloat)deviceTotalMemory {
    return [NSProcessInfo processInfo].physicalMemory / 1024.f / 1024.f;
}

+ (CGFloat)currentAvailableMemory {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count)) / 1024.f / 1024.f;
}

+ (CGFloat)deviceTotalDisk {
    NSURL *url = [[NSURL alloc] initFileURLWithPath:NSHomeDirectory()];
    NSDictionary<NSURLResourceKey, id> *dict = [url resourceValuesForKeys:@[NSURLVolumeTotalCapacityKey] error:nil];
    uint64_t capacity = [dict[NSURLVolumeTotalCapacityKey] longLongValue];
    return capacity / 1000.f / 1000.f / 1000.f;
}

+ (CGFloat)currentAvailableDisk {
    NSURL *url = [[NSURL alloc] initFileURLWithPath:NSHomeDirectory()];
    NSDictionary<NSURLResourceKey, id> *dict = [url resourceValuesForKeys:@[NSURLVolumeAvailableCapacityForImportantUsageKey] error:nil];
    uint64_t freeSize = [dict[NSURLVolumeAvailableCapacityForImportantUsageKey] longLongValue];
    return freeSize / 1000.f / 1000.f / 1000.f;
}


@end
