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

#define AKIWeakify(variable) \
    __weak __typeof(variable) __AKIWeakified_##variable = variable;

// you should only call this method after you called weakify for that same variable
#define AKIStrongify(variable) \
    __strong __typeof(variable) variable = __AKIWeakified_##variable;

#define AKIEmptyResult

#define AKIStrongifyIfNilReturn(variable) \
    AKIStrongifyIfNilReturnResult(variable, AKIEmptyResult)

#define AKIStrongifyIfNilReturnNil(variable) \
    AKIStrongifyIfNilReturnResult(variable, nil)

#define AKIStrongifyIfNilReturnResult(variable, result) \
    AKIStrongify(variable); \
    if (!variable) { \
        return result; \
    }

#define AKIPrintMethod NSLog(@"%@", NSStringFromSelector(_cmd));

#define AKIConstant(type, name, value) static type const name = value
