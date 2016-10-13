//
//  AKIMacro.h
//  iOSProject
//
//  Created by Alexey Khomych on 02.08.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#define AKIReturnOnce(result, type, block) \
    static dispatch_once_t onceToken; \
    static type *result = nil; \
    dispatch_once(&onceToken, ^{ \
        if (block) { \
            result = block(); \
        }\
    }); \
    return result;

#define AKIDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define AKIBaseViewGetterSynthesize(viewClass, propertyName) \
    @dynamic propertyName; \
    - (viewClass *)propertyName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        return nil; \
    }

#define AKIViewControllerBaseViewProperty(viewControllerClass, baseViewClass, propertyName) \
    @interface viewControllerClass (__AKIPrivateBaseView_##baseViewClass##_##propertyName) \
        AKIDefineBaseViewProperty(propertyName, baseViewClass) \
        \
    @end \
    @implementation viewControllerClass (__AKIPrivateBaseView_##baseViewClass##_##propertyName) \
        \
        AKIBaseViewGetterSynthesize(baseViewClass, propertyName) \
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

#define AKIStringConstant(name, value) static NSString * const kAKI##name = value

#define AKIPerformBlockWithParametr(block, parametr) \
    if (block) { \
        block(parametr); \
    }

#define AKIPerformBlock(block, ...) \
    AKIPerformBlockWithParametr(block, __VA_ARGS__);

#define AKIEmptyInterfaceWithExtensions(class, extensions) \
    @interface class (extensions) \
    @end
