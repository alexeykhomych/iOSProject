//
//  AKIRandomData.h
//  iOSProject
//
//  Created by Alexey Khomych on 12.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIRandomData : NSObject
@property (nonatomic, readonly) NSArray *data;

- (id)dataFromIndex:(NSUInteger)index;
- (id)dataFromIndexLiteral:(id)literal;
- (NSUInteger)countOfData;

@end
