//
//  SLCollectionViewFlowLayout.h
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLCollectionViewFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)NSInteger ColumnCount;
@property(nonatomic,weak)id<UICollectionViewDelegateFlowLayout> delegate;
@end
