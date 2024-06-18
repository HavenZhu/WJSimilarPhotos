//
//  AMTestImageViewController.m
//  DeDuplicationImage
//
//  Created by Zhu Ning on 2024/6/18.
//

#import "AMTestImageViewController.h"
#import "AMPhotoManager.h"

@interface AMTestImageViewController ()

@property (nonatomic, strong) NSArray<NSString *> *screenshotArray;

@property (nonatomic, strong) UIImageView *imv;

@end

@implementation AMTestImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.screenshotArray = [AMPhotoManager fetchScreenshotArray];
    
    [self setupViews];
    
    [self showTestImage];
}

- (void)setupViews {
    self.imv = [[UIImageView alloc] init];
    self.imv.contentMode = UIViewContentModeScaleAspectFit;
    self.imv.frame = self.view.frame;
    [self.view addSubview:self.imv];
}

- (void)showTestImage {
    NSString *identifier = self.screenshotArray[1];
    [AMPhotoManager asyncRequestImageWithIdentifier:identifier size:CGSizeMake(kScreen_Width * [UIScreen mainScreen].scale, kScreen_Height * [UIScreen mainScreen].scale) block:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imv.image = image;
        });
    }];
}

@end
