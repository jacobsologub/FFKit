/*
  ==============================================================================
 
   Copyright (C) 2016 Jacob Sologub

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to
   deal in the Software without restriction, including without limitation the
   rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
   sell copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
   IN THE SOFTWARE.
 
  ==============================================================================
*/

#import "FFAssociatedObject.h"
#import <objc/runtime.h>
#import "../utilities/macros.h"

begin_namespace (ffkit);

class AssociatedObject {
public:
    AssociatedObject (id object_) : object (object_) {}
    ~AssociatedObject() {}
    
    id getAssociatedObject (const void* key) {
        return objc_getAssociatedObject (object, key);
    }
    
    id getOrCreateAssociatedObject (const void* key, objc_AssociationPolicy policy, Class T = [NSObject class]) {
        id result = getAssociatedObject (key);
        if (result) {
            result = [T new];
            setAssociatedObject (key, result, policy);
        }
        
        return result;
    }
    
    void setAssociatedObject (const void* key, id value, objc_AssociationPolicy policy) {
        objc_setAssociatedObject (object, key, value, policy);
    }
    
private:
    id object;
};

end_namespace (ffkit);

@interface NSObject (FFKitAssociatedObject)
@property (nonatomic, strong) NSMutableDictionary<NSString*, NSString*>* associatedObjectKeyLookup;
@end
@implementation NSObject (FFKitAssociatedObject)
@dynamic associatedObjectKeyLookup;

- (NSMutableDictionary<NSString*, NSString*>*) associatedObjectKeyLookup {
    return [
        FFAssociatedObject <NSMutableDictionary<NSString*, NSString*>*>
        getOrCreate: self
        forSelector: @selector (associatedObjectKeyLookup)
        policy: FFAssociatedObjectPolicyRetainNonatomic
        type: [NSMutableDictionary class]
    ];
}
@end

@implementation FFAssociatedObject

+ (id) get: (id) object forKey: (NSString*) key {
    return ffkit::AssociatedObject (object).getAssociatedObject ((__bridge const void*) key);
}

+ (id) getOrCreate: (id) object forKey: (NSString*) key type: (Class) type {
    return ffkit::AssociatedObject (object).getOrCreateAssociatedObject ((__bridge const void*) key, OBJC_ASSOCIATION_RETAIN_NONATOMIC, type);
}

+ (id) getOrCreate: (id) object forKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy type: (Class) type {
    const objc_AssociationPolicy objc_policy = [FFAssociatedObject objc_AssociationPolicyFromFFAssociatedObjectPolicy: policy];
    return ffkit::AssociatedObject (object).getOrCreateAssociatedObject ((__bridge const void*) key, objc_policy, type);
}

+ (id) get: (id) object forSelector: (SEL) selector {
    return ffkit::AssociatedObject (object).getAssociatedObject (selector);
}

+ (id) getOrCreate: (id) object forSelector: (SEL) selector type: (Class) type {
    return ffkit::AssociatedObject (object).getOrCreateAssociatedObject (selector, OBJC_ASSOCIATION_RETAIN_NONATOMIC, type);
}

+ (id) getOrCreate: (id) object forSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy type: (Class) type {
    const objc_AssociationPolicy objc_policy = [FFAssociatedObject objc_AssociationPolicyFromFFAssociatedObjectPolicy: policy];
    return ffkit::AssociatedObject (object).getOrCreateAssociatedObject (selector, objc_policy, type);
}

+ (void) set: (id) object value: (id) value forKey: (NSString*) key {
    ffkit::AssociatedObject (object).setAssociatedObject ((__bridge const void*) (self.associatedObjectKeyLookup [key]), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void) set: (id) object value: (id) value forKey: (NSString*) key policy: (FFAssociatedObjectPolicy) policy {
    const objc_AssociationPolicy objc_policy = [FFAssociatedObject objc_AssociationPolicyFromFFAssociatedObjectPolicy: policy];
    ffkit::AssociatedObject (object).setAssociatedObject ((__bridge const void*) (self.associatedObjectKeyLookup [key]), value, objc_policy);
}

+ (void) set: (id) object value: (id) value forSelector: (SEL) selector {
    ffkit::AssociatedObject (object).setAssociatedObject (selector, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void) set: (id) object value: (id) value forSelector: (SEL) selector policy: (FFAssociatedObjectPolicy) policy {
    const objc_AssociationPolicy objc_policy = [FFAssociatedObject objc_AssociationPolicyFromFFAssociatedObjectPolicy: policy];
    ffkit::AssociatedObject (object).setAssociatedObject (selector, value, objc_policy);
}

+ (objc_AssociationPolicy) objc_AssociationPolicyFromFFAssociatedObjectPolicy: (FFAssociatedObjectPolicy) policy {
    objc_AssociationPolicy result = OBJC_ASSOCIATION_ASSIGN;
    if (policy == FFAssociatedObjectPolicyRetainNonatomic) {
        result = OBJC_ASSOCIATION_RETAIN_NONATOMIC;
    }
    else if (policy == FFAssociatedObjectPolicyCopyNonatomic) {
        result = OBJC_ASSOCIATION_COPY_NONATOMIC;
    }
    else if (policy == FFAssociatedObjectPolicyRetain) {
        result = OBJC_ASSOCIATION_RETAIN;
    }
    else if (policy == FFAssociatedObjectPolicyCopy) {
        result = OBJC_ASSOCIATION_COPY;
    }
    
    return result;
}

@end
