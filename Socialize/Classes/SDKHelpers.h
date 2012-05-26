//
//  SDKHelpers.h
//  SocializeSDK
//
//  Created by Nathaniel Griswold on 5/20/12.
//  Copyright (c) 2012 Socialize, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocializeObjects.h"
#import "SZActivityOptions.h"

@class SZShareOptions;

SZSocialNetwork LinkedSocialNetworks();
SZSocialNetwork AvailableSocialNetworks();
typedef void (^ActivityCreatorBlock)(id<SZActivity>, void(^)(id<SZActivity>), void(^)(NSError*));
SocializeShareMedium SocializeShareMediumForSZSocialNetworks(SZSocialNetwork networks);
void CreateAndShareActivity(id<SZActivity> activity, SZActivityOptions *options, SZSocialNetwork networks, ActivityCreatorBlock creator, void (^success)(id<SZActivity> activity), void (^failure)(NSError *error));
SZActivityOptions *ActivityOptionsFromUserDefaults(Class optionsClass);
void LinkWrapper(UIViewController *viewController, void (^success)(), void (^failure)(NSError *error));