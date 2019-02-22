//
//  TNSVersions.m
//  NativeScriptTests
//
//  Created by Jason Zhekov on 21/08/15.
//  Copyright (c) 2015 Jason Zhekov. All rights reserved.
//

#define generateVersionImpl
#import "TNSVersions.h"
#undef generateVersionImpl

@implementation TNSInterfaceAlwaysAvailable

+ (void)staticMethodFromProtocolAlwaysAvailable {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

+ (void)staticMethodFromProtocolNeverAvailable {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

- (void)methodFromProtocolAlwaysAvailable {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}
- (void)methodFromProtocolNeverAvailable {
    TNSLog([NSString stringWithFormat:@"%@ called", NSStringFromSelector(_cmd)]);
}

@end

@implementation TNSInterfaceNeverAvailable : TNSInterfaceAlwaysAvailable
@end

@implementation TNSInterfaceNeverAvailableDescendant : TNSInterfaceNeverAvailable
@end
