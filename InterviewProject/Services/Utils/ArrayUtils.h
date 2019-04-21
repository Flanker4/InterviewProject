//
//  ArrayUtils.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Map)
- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block;
@end


NS_ASSUME_NONNULL_END
