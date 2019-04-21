//
//  ShiftInteractorInterface.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalStorage.h"
@class Shift;
@protocol ShiftInteractorDelegate;
NS_ASSUME_NONNULL_BEGIN

@protocol ShiftInteractorInterface <DataProvider>
@property (nonatomic, weak) id<ShiftInteractorDelegate>delegate;
- (void)requestNewContent;
- (void)updateShift:(Shift*)shift withId:(NSInteger)id_;
- (Shift*)shiftAt:(NSInteger)index;
@end

@protocol ShiftInteractorDelegate <NSObject>
- (void)onNewContentReceived:(NSArray<Shift*> *)shifts;
@end
NS_ASSUME_NONNULL_END

