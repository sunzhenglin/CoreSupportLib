//
//  NSBundle+txSubBundle.h
//  AFNetworking
//
//  Created by Zlin Sun on 2019/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle(txSubBundle)  
+(instancetype)tx_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass;
@end

NS_ASSUME_NONNULL_END
