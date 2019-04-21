//
//  ShiftModuleConfigurator.m
//  InterviewProject
//
//  Created by Andrey Boyko on 4/21/19.
//  Copyright © 2019 Andrey Boyko. All rights reserved.
//

#import "ShiftModuleConfigurator.h"
#import "ShiftRouter.h"
#import "ShiftInteractor.h"
#import "ShiftPresenter.h"

@implementation ShiftModuleConfigurator
+ (void)configurateModuleWithViewController:(id<ShiftListViewInterface>)vc rootVC:(UINavigationController*)rootVC {
    
    id<ShiftRouterInterface> router = [[ShiftRouter alloc] initWithRootViewController:rootVC];
    id<ShiftInteractorInterface> interactor = [ShiftInteractor new];
    id<ShiftPresenterInterface, ShiftListViewDelegate, ShiftInteractorDelegate> presenter = [ShiftPresenter new];
    
    vc.delegate = presenter;
    
    presenter.view = vc;
    presenter.router = router;
    presenter.interactor = interactor;
    
    interactor.delegate = presenter;
    
    [vc.delegate userWantsLatestContent];
}
@end
