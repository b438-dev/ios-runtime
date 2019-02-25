//
//  TNSInheritance.m
//  NativeScriptTests
//
//  Created by Jason Zhekov on 2/26/14.
//  Copyright (c) 2014 Jason Zhekov. All rights reserved.
//

#import "TNSInheritance.h"

@implementation TNSIConstructorVirtualCalls

- (id)initWithX:(int)x andY:(int)y {
    TNSLog([NSString stringWithFormat:@"constructor initWithX:%dandY:%d called", x, y]);

    if (self = [super init]) {
        _x = x;
        _y = y;
    }

    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"x: %d; y: %d", _x, _y];
}

@end

@implementation TNSIBaseInterface
+ (void)staticBaseImplementedOptionalMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

- (void)baseImplementedOptionalMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation TNSIBaseInterface (TNSIBaseCategory)
+ (void)staticBaseImplementedCategoryMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

- (void)baseImplementedCategoryMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}
@end

@implementation TNSIDerivedInterface
+ (void)staticDerivedImplementedOptionalMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

- (void)derivedImplementedOptionalMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}
@end

@implementation TNSIDerivedInterface (TNSIDerivedCategory)
+ (void)staticDerivedImplementedCategoryMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

- (void)derivedImplementedCategoryMethod {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}
@end
#pragma clang diagnostic pop

@implementation TNSIterableConsumer

+ (void)consumeIterable:(id<NSFastEnumeration>)iterable {
    for (id obj in iterable) {
        TNSLog([obj description]);
    }
}

@end
