// This is a generated file. Not intended for manual editing.
package org.intellij.plugins.ceylon.psi.impl;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.util.PsiTreeUtil;
import static org.intellij.plugins.ceylon.psi.CeylonTypes.*;
import org.intellij.plugins.ceylon.psi.*;

public class CeylonSwitchCaseElseImpl extends CeylonCompositeElementImpl implements CeylonSwitchCaseElse {

  public CeylonSwitchCaseElseImpl(ASTNode node) {
    super(node);
  }

  @Override
  @NotNull
  public CeylonCases getCases() {
    return findNotNullChildByClass(CeylonCases.class);
  }

  @Override
  @NotNull
  public CeylonSwitchHeader getSwitchHeader() {
    return findNotNullChildByClass(CeylonSwitchHeader.class);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof CeylonVisitor) ((CeylonVisitor)visitor).visitSwitchCaseElse(this);
    else super.accept(visitor);
  }

}
