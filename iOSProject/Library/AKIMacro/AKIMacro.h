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
//AKIViewControllerBaseViewProperty(AKIUsersViewController, userView, AKIUserView)
#define AKIViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__AKIPrivateBaseView_##baseViewClass) \
    AKIDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__AKIPrivateBaseView_##baseViewClass) \
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

#define AKIStrongifyAndReturnIfNil(variable) \
    AKIStrongifyAndReturnResultIfNil(variable, AKIEmptyResult) \

#define AKIStrongifyAndReturnNilIfNil(variable) \
    AKIStrongifyAndReturnResultIfNil(variable, nil)

#define AKIStrongifyAndReturnResultIfNil(variable, result) \
    AKIStrongify(variable); \
        if (!variable) { \
            return result; \
        } \

#define AKIPrintMethod NSLog(@"%@", NSStringFromSelector(_cmd));

#define AKIConstant(type, name, value) static type const kAKI##name = value

#define AKIPerformBlockWithParametr(block, parametr) \
    if (block) { \
        block(parametr); \
    }

#define AKIPerformBlock(block, ...) \
    AKIPerformBlockWithParametr(block, __VA_ARGS__);
