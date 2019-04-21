//
//  ShiftPresenterInterface.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShiftRouterInterface.h"
#import "ShiftViewInterface.h"
#import "ShiftInteractorInterface.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ShiftPresenterInterface

// View owns presenter because of UIKit, accourding to this we use 'weak'.
@property (nonatomic, weak) id<ShiftListViewInterface> view;
@property (nonatomic, weak, nullable) id<ShiftDetailViewInterface> viewDetails;

// Contains bussiness logic.
@property (nonatomic, strong) id<ShiftInteractorInterface> interactor;

// Allows to perform routing between modules (Screens)
@property (nonatomic, strong) id<ShiftRouterInterface> router;

@end


NS_ASSUME_NONNULL_END
