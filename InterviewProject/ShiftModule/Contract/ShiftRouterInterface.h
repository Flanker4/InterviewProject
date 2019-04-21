//
//  ShiftRouterInterface.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

@import Foundation;
@class Shift;
NS_ASSUME_NONNULL_BEGIN

@protocol ShiftRouterInterface <NSObject>
- (void)presentPicker:(NSArray<NSString*>*)options
           completion:(void(^)(NSString* selectedOption))completionBlock;
- (void)presentDatePicker:(nullable NSDate*)startDate completion:(void(^)(NSDate* selectedDate))completionBlock;
- (void)presentShiftDetails;
- (void)moveBack;
@end

NS_ASSUME_NONNULL_END
