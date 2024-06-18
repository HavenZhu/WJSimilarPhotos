//
//  AMPhotoManager.h
//  DeDuplicationImage
//
//  Created by mac on 2021/3/5.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@class UIImage, PHAsset;

@interface AMPhotoManager : NSObject

// 获取相册所有的照片identifier
+ (NSArray<NSString *> *)getAlbumPhotos;
// 获取相册图片数组
+ (NSArray<NSArray<PHAsset *> *> *)fetchSimilarArray;
// 获取所有的屏幕截图
+ (NSArray<NSString *> *)fetchScreenshotArray;

+ (void)requestImage:(PHAsset *)asset targetSize:(CGSize)targetSize synchronous:(BOOL)isSync block:(void(^)(UIImage *image))block;
+ (PHAsset *)requestAssetWithIdentifier:(NSString *)identifier;

+ (void)asyncRequestImageWithIdentifier:(NSString *)identifier size:(CGSize)targetSize block:(void(^)(UIImage *image))block;

+ (void)syncRequestImage:(PHAsset *)asset targetSize:(CGSize)size block:(void(^)(UIImage *image))block;
+ (UIImage *)syncRequestImage:(PHAsset *)asset targetSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
