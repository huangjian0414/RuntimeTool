//
//  NSArray+HJSafe.m
//  Runtime
//
//  Created by huangjian on 2018/7/20.
//  Copyright © 2018年 huangjian. All rights reserved.
//

#import "NSArray+HJSafe.h"
#import "NSObject+Runtime_HJ.h"
@implementation NSArray (HJSafe)
+ (void)load
{
    [NSClassFromString(@"__NSPlaceholderArray") swapMethod:@selector(initWithObjects:count:)
                                             currentMethod:@selector(hj_initWithObjects:count:)];
    
    [NSClassFromString(@"__NSArrayI") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(hj_objectAtIndex:)];
    
    [NSClassFromString(@"__NSArray0") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(hj_zeroObjectAtIndex:)];
    
    [NSClassFromString(@"__NSSingleObjectArrayI") swapMethod:@selector(objectAtIndex:)
                                               currentMethod:@selector(hj_singleObjectAtIndex:)];
}

- (instancetype)hj_initWithObjects:(id *)objects count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (!objects[i])
        {
            break;
        }
        newCnt++;
    }
    
    return [self hj_initWithObjects:objects count:newCnt];
}

- (id)hj_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        return nil;
    }
    return [self hj_objectAtIndex:index];
}

- (id)hj_zeroObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self hj_zeroObjectAtIndex:index];
}

- (id)hj_singleObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self hj_singleObjectAtIndex:index];
}
@end

@implementation NSMutableArray (HJSafe)
+ (void)load
{
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(hj_objectAtIndex:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(addObject:)
                                   currentMethod:@selector(hj_addObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectAtIndex:)
                                   currentMethod:@selector(hj_removeObjectAtIndex:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(replaceObjectAtIndex:withObject:)
                                   currentMethod:@selector(hj_replaceObjectAtIndex:withObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectsInRange:)
                                   currentMethod:@selector(hj_removeObjectsInRange:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(insertObject:atIndex:)
                                   currentMethod:@selector(hj_insertObject:atIndex:)];
}

- (id)hj_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        return nil;
    }
    return [self hj_objectAtIndex:index];
}

- (void)hj_addObject:(id)anObject
{
    if (!anObject)
    {
        return;
    }
    [self hj_addObject:anObject];
}

- (void)hj_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        return;
    }
    
    return [self hj_removeObjectAtIndex:index];
}

- (void)hj_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index >= [self count])
    {
        return;
    }
    
    if (!anObject)
    {
        return;
    }
    
    [self hj_replaceObjectAtIndex:index withObject:anObject];
}

- (void)hj_removeObjectsInRange:(NSRange)range
{
    if (range.location > self.count)
    {
        return;
    }
    
    if (range.length > self.count)
    {
        return;
    }
    
    if ((range.location + range.length) > self.count)
    {
        return;
    }
    
    return [self hj_removeObjectsInRange:range];
}

- (void)hj_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (index > self.count)
    {
        return;
    }
    
    if (!anObject)
    {
        return;
    }
    
    [self hj_insertObject:anObject atIndex:index];
}
@end
