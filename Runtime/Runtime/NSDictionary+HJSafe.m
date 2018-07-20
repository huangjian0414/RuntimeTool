//
//  NSDictionary+HJSafe.m
//  Runtime
//
//  Created by huangjian on 2018/7/20.
//  Copyright © 2018年 huangjian. All rights reserved.
//

#import "NSDictionary+HJSafe.h"
#import "NSObject+Runtime_HJ.h"
@implementation NSDictionary (HJSafe)
+(void)load
{
    [NSClassFromString(@"__NSPlaceholderDictionary") swapMethod:@selector(initWithObjects:forKeys:count:)
                                                  currentMethod:@selector(hj_initWithObjects:forKeys:count:)];
}
- (instancetype)hj_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        id key = keys[i];
        id obj = objects[i];
        if (!key)
        {
            continue;
        }
        if (!obj)
        {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    
    return [self hj_initWithObjects:safeObjects forKeys:safeKeys count:j];
}
@end

@implementation NSMutableDictionary (HJSafe)
+ (void)load
{
    [NSClassFromString(@"__NSDictionaryM") swapMethod:@selector(setObject:forKey:)
                                        currentMethod:@selector(hj_setObject:forKey:)];
}

- (void)hj_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (aKey&&anObject) {
        [self hj_setObject:anObject forKey:aKey];
    }
    return;
    
}

@end
