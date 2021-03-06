/********************************************************************************
 * Copyright (c) {date} Red Hat Inc. and/or its affiliates and others
 *
 * This program and the accompanying materials are made available under the 
 * terms of the Apache License, Version 2.0 which is available at
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * SPDX-License-Identifier: Apache-2.0 
 ********************************************************************************/
import com.intellij.psi {
    PsiMethod,
    PsiModifier,
    PsiType,
    PsiAnnotationMethod,
    PsiClass,
    SmartPsiElementPointer
}
import org.eclipse.ceylon.model.loader.mirror {
    MethodMirror,
    TypeParameterMirror,
    VariableMirror
}

import java.util {
    Arrays
}

import org.eclipse.ceylon.ide.intellij.model {
    concurrencyManager {
        needReadAccess,
        dontCancel
    }
}

shared class PSIMethod
        extends PSIAnnotatedMirror
        satisfies MethodMirror {

    SmartPsiElementPointer<out PsiMethod> psiPointer;

    shared new (SmartPsiElementPointer<out PsiMethod> psiPointer)
            extends PSIAnnotatedMirror(psiPointer) {
        this.psiPointer = psiPointer;
    }

    shared PsiMethod psi => get(psiPointer);

    shared Return withContainingClass<Return>(Return do(PsiClass clazz), Return default)
            => needReadAccess(()
                => if (exists clazz = psi.containingClass) then do(clazz) else default);


    shared actual late PSIType? returnType
            = needReadAccess(()
                => if (exists type = psi.returnType) then PSIType(type) else null);

    abstract => psi.hasModifierProperty(PsiModifier.abstract)
            || withContainingClass(PsiClass.\iinterface, false);

    constructor => dontCancel(() => psi.constructor);
    
    declaredVoid => (psi.returnType else PsiType.null) == PsiType.\ivoid;
    
    default => if (is PsiAnnotationMethod meth = psi)
               then needReadAccess(() => meth.defaultValue exists)
               else false;

    enclosingClass => withContainingClass((cc) => PSIClass(pointer(cc)), null);
    
    final => psi.hasModifierProperty(PsiModifier.final);

    parameters
            => needReadAccess(()
                => Arrays.asList<VariableMirror>(
                    for (parameter in psi.parameterList.parameters)
                        PSIParameter(parameter)));

    static => psi.hasModifierProperty(PsiModifier.static);

    staticInit => false;
    
    typeParameters
            => needReadAccess(() =>
                Arrays.asList<TypeParameterMirror>(
                    for (typeParam in psi.typeParameters)
                        PSITypeParameter(typeParam)));
    
    variadic => psi.varArgs;

    string => "PSIMethod[``name``]";
    
    defaultMethod => psi.hasModifierProperty(PsiModifier.default);
}