//
//  SLCollectionViewFlowLayout.m
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import "SLCollectionViewFlowLayout.h"

@interface SLCollectionViewFlowLayout()
@property (nonatomic,strong)NSMutableArray *columnH;
@property (nonatomic,assign)CGFloat itemW;
@property (nonatomic,strong)NSMutableArray *itemH;
@property (nonatomic, strong) NSArray *layoutAttributesArray;

@end
@implementation SLCollectionViewFlowLayout

/**
 *  获得每个cell的高度，宽度
 */
-(void)prepareLayout{
    self.itemH = [NSMutableArray array];
    self.columnH = [NSMutableArray array];
//    self.layoutAttributesArray = [NSMutableArray array];
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (int i =0; i<itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        NSNumber *numH =@([self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath].height);
        [self.itemH addObject:numH];
        self.itemW = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath].width;
        
    }
    [self computeAttributes:itemCount];
}

-(void)computeAttributes:(NSInteger)itemCount{
    
    for (int i=0; i<self.ColumnCount; i++) {
        self.columnH[i] = @0;
    }
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:itemCount];
    
    for (int i =0; i<itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        NSInteger shorterColum = [self shortestColumn:self.columnH];
        
        CGFloat itemX = self.itemW * shorterColum;
        
        CGFloat itemY = [self.columnH[shorterColum] floatValue];
        
        attribute.frame = CGRectMake(itemX, itemY, self.itemW, [self.itemH[i] floatValue]);
        
        CGFloat shortestH = [self.columnH[shorterColum] floatValue];
        shortestH += [self.itemH[i] floatValue];
        self.columnH[shorterColum] = @(shortestH);
        
        
        
        
//        self.itemSize = CGSizeMake(self.itemW, [self.columnH[highest] floatValue]);
        
        
        
        [attributesArray addObject: attribute];
    }

    
    self.layoutAttributesArray = attributesArray;
    

}

-(CGSize)collectionViewContentSize{
    NSInteger highest = [self highestColumn:self.columnH];
    
    return  CGSizeMake(self.itemW,[self.columnH[highest] floatValue]);

}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return self.layoutAttributesArray;
}

-(NSInteger)shortestColumn:(NSMutableArray *)arrayH{
    NSNumber *numShortest =arrayH[0];
    NSInteger key = 0;
    for (int i =0; i<[arrayH count]; i++) {
        NSNumber *num = arrayH[i];
        if ([num floatValue]<[numShortest floatValue]) {
            key = i;
            numShortest = num;

        }
    }
    
    return key;
}

-(NSInteger)highestColumn:(NSMutableArray *)arrayH{
    NSNumber *numHighest =arrayH[0];
    NSInteger key = 0;
    for (int i =0; i<[arrayH count]; i++) {
        NSNumber *num = arrayH[i];
        if ([num floatValue]>[numHighest floatValue]) {
            key = i;
            numHighest = num;
            
        }
    }
    return key;

}


@end
