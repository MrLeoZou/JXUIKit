//
//  UIImageView+TCUIKit.m
//  TCUIKit
//
//  Created by ekohu on 2019/2/27.
//  Copyright © 2019 Tencent. All rights reserved.
//

#import "UIImageView+TCUIKit.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>

@implementation UIImageView (TCUIKit)
-(void)setImageWithString:(NSString*)url placeholderImage:(UIImage *)placeholder
{
    NSURL* URL = url ? [NSURL URLWithString:url] : nil;
    [self sd_setImageWithURL:URL placeholderImage:placeholder];
}


-(void)setImageWithString:(NSString*)url placeholderImage:(UIImage *)placeholder option:(SDWebImageOptions)option completionBlock:(TCImageUrlCompletionBlock)completionBlock
{
    BOOL changed = ![url isEqualToString:[self.sd_imageURL absoluteString]];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder options:option progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if (completionBlock)
         {
             completionBlock(image, error, imageURL, changed);
         }
     }];
}

-(NSString*)urlString
{
    return [[self sd_imageURL] absoluteString];
}
@end
