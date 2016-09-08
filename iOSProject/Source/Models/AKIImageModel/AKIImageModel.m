//
//  AKIImageModel.m
//  iOSProject
//
//  Created by Alexey Khomych on 16.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIImageModel.h"

#import "AKIMacro.h"

@interface AKIImageModel()
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSURL         *url;
@property (nonatomic, strong) NSOperation   *operation;

- (NSOperation *)imageLoadingOperation;

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

- (void)load {
    @synchronized (self) {
        if (AKIImageModelLoading == self.state) {
            return;
        }
        
        if (AKIImageModelLoaded == self.state) {
            [self notifyOfState:AKIImageModelLoaded];
            return;
        }
        
        self.state = AKIImageModelLoading;
    }
    
    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = AKIImageModelUnloaded;
}

#pragma mark -
#pragma mark Private

- (NSOperation *)imageLoadingOperation {
    AKIWeakify(self);
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        AKIStrongifyAndReturnIfNil(self);
        self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
    }];
    
    operation.completionBlock = ^{
        AKIStrongify(self);
        @synchronized (self) {
            self.state = self.image ? AKIImageModelLoaded : AKIImageModelLoading;
        }
    };

    return operation;
}

@end
