//
//  AMCompare.h
//  DeDuplicationImage
//
//  Created by mac on 2021/4/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIImage, PHAsset;

@interface AMCompare : NSObject

- (void)handleLowLevelImage:(PHAsset *)representObjct withImage:(PHAsset *)challengeObject;
- (void)handleHighLevelImage:(PHAsset *)representObjct withImage:(PHAsset *)challengeObject;

- (BOOL)phashCompare;
- (BOOL)orbCompare;
- (BOOL)histogramCompare;

@end

NS_ASSUME_NONNULL_END
