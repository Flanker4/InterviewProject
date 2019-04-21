//
//  ShiftViewInterface.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

@import Foundation;
@class Shift;
@protocol ShiftDetailViewDelegate, ShiftListViewDelegate;

NS_ASSUME_NONNULL_BEGIN

@protocol ShiftDetailViewInterface <NSObject>
@property (nonatomic, strong) id<ShiftDetailViewDelegate> delegate;

- (void)displayShift:(Shift*)shift;
@end

@protocol ShiftDetailViewDelegate <NSObject>
- (void)userWantsDetails;
- (void)userWantsSaveShift;
- (void)userWantsSelectRole;
- (void)userWantsSelectEmployee;
- (void)userWantsSelectStartDate;
- (void)userWantsSelectEndDate;
- (void)userWantsSelectColor;
@end

@protocol ShiftListViewInterface <NSObject>
@property (nonatomic, strong) id<ShiftListViewDelegate> delegate;
- (void)displayShifts:(NSArray<Shift*>*)shift;
@end

@protocol ShiftListViewDelegate <NSObject>
- (void)userWantsLatestContent;
- (void)userWantsAddShift;
- (void)userWantsDetailsAboutShiftAt:(NSInteger)index;
- (void)prepareDetailView:(id<ShiftDetailViewInterface>)view;
@end

NS_ASSUME_NONNULL_END
