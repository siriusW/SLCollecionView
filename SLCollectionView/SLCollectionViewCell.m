//
//  SLCollectionViewCell.m
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import "SLCollectionViewCell.h"
#import <UIImageView+AFNetworking.h>

//static const CGFloat MarginLeft=4.0;
//static const CGFloat MarginRow=2.0;
@implementation SLCollectionViewCell
//
//-(instancetype)initWithFrame:(CGRect)frame{
////    CGFloat w = [UIScreen mainScreen].bounds.size.width;
////    CGFloat h = [UIScreen mainScreen].bounds.size.height;
//    self = [super initWithFrame:frame];
//    if (self) {
////        UIImageView *thumbImage = [[UIImageView alloc] init];
////        thumbImage.tag = 151;
////        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(MarginLeft, frame.size.height-70, frame.size.width, 40)];
////        self.nameLabel.textColor = [UIColor grayColor];
////        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(MarginLeft, self.nameLabel.bounds.origin.y+44,frame.size.width-frame.size.width/3, 70-40)];
////        self.priceLabel.textColor = [UIColor redColor];
////        self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(MarginLeft, 0, 30, 30)];
////        self.titleImage.center = CGPointMake(frame.size.width-15, self.priceLabel.center.y);
////        
////        [self.contentView addSubview:self.nameLabel];
////        [self.contentView addSubview:self.priceLabel];
////        [self.contentView addSubview:self.titleImage];
//    }
//    
//    return self;
//}

- (void)awakeFromNib {
    // Initialization code
}


-(void)setImage:(NSString *)url{
    
//    UIImageView *thumbImage = (UIImageView *)[self viewWithTag:151];
    __weak UIImageView *weakImage = self.imageTitle;
    __weak SLCollectionViewCell *weakCell = self;
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.imageTitle setImageWithURLRequest:urlRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        CGFloat imageH = self.frame.size.width/image.size.width * image.size.height;
        weakImage.frame = CGRectMake(0, 0, weakCell.frame.size.width, imageH);
        weakImage.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
    }];
}


@end
