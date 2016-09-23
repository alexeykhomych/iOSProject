//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIMacro.h"

#import "AKIGCD.h"

@interface AKIImageModel()
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSURL         *url;
@property (nonatomic, strong) NSOperation   *operation;

@end

@implementation AKIImageModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[super alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.operation = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [self init];
    
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOperation:(NSOperation *)operation {
    if (_operation != operation) {
        [_operation cancel];
        _operation = operation;
    }
}

#pragma mark -
#pragma mark Public

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = AKIImageModelUnloaded;
}

#pragma mark -
#pragma mark Private

- (void)performLoading {
    AKIAsyncPerformInBackground(^{
        self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
        
        self.state = self.image ? AKIModelDidLoad : AKIModelWillLoad;
    });
}

#pragma mark -
#pragma mark AKIObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIImageModelFailedLoading:
            return @selector(imageModelFailedLoading);
        
        case AKIImageModelUnloaded:
            return @selector(imageModelUnloaded);
            
        default:
            return nil;
    }
}

@end
