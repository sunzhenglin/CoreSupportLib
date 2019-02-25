//
//  NSBundle+txSubBundle.m
//  AFNetworking
//
//  Created by Zlin Sun on 2019/2/22.
//

#import "UIImage+txSubBundle.h"

@implementation UIImage(txSubBundle)
 
+ (instancetype)tx_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass{
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *curB = [NSBundle bundleForClass:targetClass];
    NSString *imgName = [NSString stringWithFormat:@"%@@%zdx.png", name,scale];
    NSString *dir = [NSString stringWithFormat:@"%@.bundle",bundleName];
    NSString *path = [curB pathForResource:imgName ofType:nil inDirectory:dir];
    return path?[UIImage imageWithContentsOfFile:path]:nil;
}
@end
