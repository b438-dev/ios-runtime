//
//  ObjCMethodCall.h
//  NativeScript
//
//  Created by Yavor Georgiev on 12.06.14.
//  Copyright (c) 2014 г. Telerik. All rights reserved.
//

#ifndef __NativeScript__ObjCMethodCall__
#define __NativeScript__ObjCMethodCall__

#include "FFICall.h"
#include "FunctionWrapper.h"
#include "JavaScriptCore/IsoSubspace.h"

namespace Metadata {
struct MemberMeta;
}

namespace NativeScript {
class ObjCMethodWrapper : public FunctionWrapper {
public:
    typedef FunctionWrapper Base;

    static ObjCMethodWrapper* create(JSC::VM& vm, GlobalObject* globalObject, JSC::Structure* structure, std::vector<const Metadata::MemberMeta*> metadata) {
        ObjCMethodWrapper* cell = new (NotNull, JSC::allocateCell<ObjCMethodWrapper>(vm.heap)) ObjCMethodWrapper(vm, structure);
        cell->finishCreation(vm, globalObject, metadata);
        return cell;
    }

    DECLARE_INFO;

    template <typename CellType>
    static JSC::IsoSubspace* subspaceFor(JSC::VM& vm) {
        return &vm.tnsObjCMethodWrapperSpace;
    }

    static JSC::Structure* createStructure(JSC::VM& vm, JSC::JSGlobalObject* globalObject, JSC::JSValue prototype) {
        return JSC::Structure::create(vm, globalObject, prototype, JSC::TypeInfo(JSC::InternalFunctionType, StructureFlags), info());
    }

private:
    ObjCMethodWrapper(JSC::VM& vm, JSC::Structure* structure)
        : Base(vm, structure) {
    }

    void finishCreation(JSC::VM&, GlobalObject*, std::vector<const Metadata::MemberMeta*> methods);

    static void preInvocation(FFICall*, JSC::ExecState*, FFICall::Invocation&);
    static void postInvocation(FFICall*, JSC::ExecState*, FFICall::Invocation&);

    static void destroy(JSC::JSCell* cell) {
        static_cast<ObjCMethodWrapper*>(cell)->~ObjCMethodWrapper();
    }
};

class ObjCMethodCall : public FFICall {

public:
    ObjCMethodCall(FunctionWrapper* owner)
        : FFICall(owner) {
    }

    SEL selector() {
        return this->_selector;
    }

    void setSelector(SEL aSelector) {
        this->_selector = aSelector;
    }

    bool retainsReturnedCocoaObjects() {
        return this->_retainsReturnedCocoaObjects;
    }

    void* _msgSend;

    void* _msgSendSuper;

    bool _retainsReturnedCocoaObjects;

    bool _hasErrorOutParameter;

    bool _isOptional;

    bool _isInitializer;

    SEL _selector;
};
} // namespace NativeScript

#endif /* defined(__NativeScript__ObjCMethodCall__) */
