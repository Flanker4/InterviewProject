//
//  ShiftPresenter.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftPresenter.h"
#import "Shift.h"

@interface ShiftPresenter()
@property (strong, nonatomic) Shift* editShift;
@property (nonatomic) NSInteger editShiftId;
@end


@implementation ShiftPresenter
@synthesize interactor;
@synthesize router;
@synthesize view;
@synthesize viewDetails;

- (void)resetEdititng {
    self.editShiftId = NSNotFound;
    self.editShift = nil;
}
@end

@implementation ShiftPresenter (ShiftListViewDelegate)
- (void)userWantsLatestContent {
    [self.interactor requestNewContent];
}

- (void)userWantsAddShift {
    self.editShift = [Shift new];
    self.editShiftId = NSNotFound;
    
    [self.router presentShiftDetails];
}

- (void)prepareDetailView:(nonnull id<ShiftDetailViewInterface>)view {
    self.viewDetails = view;
    self.viewDetails.delegate = self;
}

- (void)updateDetailsView {
    [self.viewDetails displayShift:self.editShift];
}

- (void)userWantsDetailsAboutShiftAt:(NSInteger)index {
    self.editShiftId = index;
    self.editShift = [self.interactor shiftAt:index].copy;
    [self.router presentShiftDetails];
}
@end

@implementation ShiftPresenter (ShiftDetailsViewDelegate)
- (void)userWantsDetails {
    [self updateDetailsView];
}

- (void)userWantsSaveShift {
    [self.interactor updateShift:self.editShift withId:self.editShiftId];
    [self.router moveBack];
    [self resetEdititng];
}

- (void)userWantsSelectColor {
    __weak ShiftPresenter *wSelf = self;
    [self.router presentPicker:self.interactor.allColors completion:^(NSString * selectedOption) {
        wSelf.editShift.color = selectedOption.lowercaseString;
        [wSelf updateDetailsView];
    }];
}

- (void)userWantsSelectEmployee {
    __weak ShiftPresenter *wSelf = self;
    [self.router presentPicker:self.interactor.allPersones completion:^(NSString * selectedOption) {
        wSelf.editShift.person = selectedOption;
        [wSelf updateDetailsView];
    }];
}

- (void)userWantsSelectEndDate {
    __weak ShiftPresenter *wSelf = self;
    [self.router presentDatePicker:self.editShift.startDate completion:^(NSDate * selectedDate) {
        wSelf.editShift.endDate = selectedDate;
        [wSelf updateDetailsView];
    }];
}

- (void)userWantsSelectStartDate {
    __weak ShiftPresenter *wSelf = self;
    [self.router presentDatePicker:nil completion:^(NSDate * selectedDate) {
        wSelf.editShift.startDate = selectedDate;
        [wSelf updateDetailsView];
    }];
}

- (void)userWantsSelectRole {
    __weak ShiftPresenter *wSelf = self;
    [self.router presentPicker:self.interactor.allRoles completion:^(NSString * selectedOption) {
        wSelf.editShift.role = selectedOption;
        [wSelf updateDetailsView];
    }];
}


@end

@implementation ShiftPresenter (ShiftInteractorDelegate)
- (void)onNewContentReceived:(nonnull NSArray<Shift *> *)shifts {
    [self.view displayShifts:shifts];
}
@end



