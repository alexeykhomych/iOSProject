//
//  iOSProjectTests.m
//  iOSProjectTests
//
//  Created by Alexey Khomych on 27.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "Kiwi.h"

#import "NSMutableArray+AKIExtension.h"

SPEC_BEGIN(AKIDelegatingObjectSpec)

describe(@"AKIMutableArray", ^{
    __block AKIMutableArray *array = nil;
    
    beforeAll(^{
        array = [NSMutableArray new];
    });
    
    context(@"", ^{
        it(@"", ^{
            //                [[delegate shouldNot] receive:@selector(delegatingObject:didChangeState:)];
            //
            //                delegatingObject.state = 1;
        });
    });
    
    context(@"", ^{
        it(@"", ^{
            
        });
    });
});

SPEC_END