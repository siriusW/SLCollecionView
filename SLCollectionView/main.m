//
//  main.m
//  SLCollectionView
//
//  Created by wenshl on 15/7/7.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


/**
 *  1.创建UIApplication对象
 *  2.AppDelegate对象，并且成为UIApplication对象代理属性
 *  3.开启主允许循环：目的让程序一直跑起来
 *  4.加载info.plist文件，判断info.plist文件中有木有指定main.storyboard,如果有指定，就去加
 *  载main.storyboard
 *  main.storyboard
 *  1.初始化窗口
 *  2.加载storyboard文件，并且创建箭头指向的ViewController
 *  3.把创建的控制器作为窗口的rooViewController,并让窗口显示
 */
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
