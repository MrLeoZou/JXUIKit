//
//  UIImageView+TCUIKit.h
//  TCUIKit
//
//  Created by ekohu on 2019/2/27.
//  Copyright © 2019 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageManager.h>

typedef void(^TCImageUrlCompletionBlock)(UIImage *image, NSError *error, NSURL *imageURL, BOOL changed);
@interface UIImageView (TCUIKit)
-(void)setImageWithString:(NSString*)url placeholderImage:(UIImage *)placeholder;
-(void)setImageWithString:(NSString*)url placeholderImage:(UIImage *)placeholder option:(SDWebImageOptions)option completionBlock:(TCImageUrlCompletionBlock)completionBlock;
-(NSString*)urlString;
@end
