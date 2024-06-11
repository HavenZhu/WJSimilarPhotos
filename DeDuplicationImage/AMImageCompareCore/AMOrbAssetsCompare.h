//
//  AMOrbAssetsCompare.h
//  DeDuplicationImage
//
//  Created by mac on 2021/4/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIImage;

@interface AMOrbAssetsCompare : NSObject

- (double)handleImage:(UIImage *)image1 withImage:(UIImage *)image2;

@end

NS_ASSUME_NONNULL_END
