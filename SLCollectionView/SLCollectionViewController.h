//
//  SLCollectionViewController.h
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLCollectionViewFlowLayout;

extern CGFloat const Width;
@interface SLCollectionViewController : UICollectionViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet SLCollectionViewFlowLayout *flowLayout;

@end
