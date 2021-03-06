/********************************************************************************
 * Copyright (c) {date} Red Hat Inc. and/or its affiliates and others
 *
 * This program and the accompanying materials are made available under the 
 * terms of the Apache License, Version 2.0 which is available at
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * SPDX-License-Identifier: Apache-2.0 
 ********************************************************************************/
import org.eclipse.ceylon.ide.common.correct {
    convertSwitchToIfQuickFix,
    convertSwitchStatementToExpressionQuickFix,
    convertSwitchExpressionToStatementQuickFix
}
import org.eclipse.ceylon.ide.common.util {
    nodes
}

import org.eclipse.ceylon.ide.intellij.psi {
    CeylonFile
}

shared class ConvertSwitchToIfIntention() extends AbstractIntention() {
    
    familyName => "Convert 'switch' to 'if'";
    
    shared actual void checkAvailable(IdeaQuickFixData data, CeylonFile file, Integer offset) {
        value statement = nodes.findStatement(data.rootNode, data.node);
        
        convertSwitchToIfQuickFix.addConvertSwitchToIfProposal(data, statement);
    }
}

shared class ConvertIfToSwitchIntention() extends AbstractIntention() {
    
    familyName => "Convert 'if' to 'switch'";
    
    shared actual void checkAvailable(IdeaQuickFixData data, CeylonFile file, Integer offset) {
        value statement = nodes.findStatement(data.rootNode, data.node);
        
        convertSwitchToIfQuickFix.addConvertIfToSwitchProposal(data, statement);
    }
}

shared class ConvertSwitchStatementToExpressionIntention() extends AbstractIntention() {

    familyName => "Convert 'switch' statement to expression";

    shared actual void checkAvailable(IdeaQuickFixData data, CeylonFile file, Integer offset) {
        value statement = nodes.findStatement(data.rootNode, data.node);

        convertSwitchStatementToExpressionQuickFix.addConvertSwitchStatementToExpressionProposal(data, statement);
    }
}

shared class ConvertSwitchExpressionToStatementIntention() extends AbstractIntention() {

    familyName => "Convert 'switch' expression to statement";

    shared actual void checkAvailable(IdeaQuickFixData data, CeylonFile file, Integer offset) {
        value statement = nodes.findStatement(data.rootNode, data.node);

        convertSwitchExpressionToStatementQuickFix.addConvertSwitchExpressionToStatementProposal(data, statement);
    }
}
