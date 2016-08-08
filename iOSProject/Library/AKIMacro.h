//
//  AKIMacro.h
//  iOSProject
//
//  Created by Alexey Khomych on 02.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#define AKIDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define AKIBaseViewGetterSynthesize(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define AKIViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__AKIPrivateBaseView) \
    AKIDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__AKIPrivateBaseView) \
    \
    @dynamic propertyName; \
    \
    AKIBaseViewGetterSynthesize(propertyName, baseViewClass) \
    \
    @end
