//
//  ShiftPresenter.h
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShiftPresenterInterface.h"
#import "ShiftViewInterface.h"
#import "ShiftInteractorInterface.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShiftPresenter : NSObject<ShiftPresenterInterface>

@end

@interface ShiftPresenter (ShiftListViewDelegate) <ShiftListViewDelegate>

@end

@interface ShiftPresenter (ShiftDetailViewDelegate) <ShiftDetailViewDelegate>

@end

@interface ShiftPresenter (ShiftInteractorDelegate) <ShiftInteractorDelegate>

@end
NS_ASSUME_NONNULL_END
