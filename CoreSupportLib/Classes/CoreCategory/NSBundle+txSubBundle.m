//
//  NSBundle+txSubBundle.m
//  AFNetworking
//
//  Created by Zlin Sun on 2019/2/22.
//

#import "NSBundle+txSubBundle.h"

@implementation NSBundle(txSubBundle)
+(instancetype)tx_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass{
    NSBundle *bundle =[NSBundle bundleForClass:targetClass];
    NSString *path =[bundle pathForResource:bundleName ofType:@"bundle"];
    return path?[NSBundle bundleWithPath:path]:[NSBundle mainBundle];
}
@end
