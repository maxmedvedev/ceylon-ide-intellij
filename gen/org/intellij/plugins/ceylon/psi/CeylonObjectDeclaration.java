// This is a generated file. Not intended for manual editing.
package org.intellij.plugins.ceylon.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface CeylonObjectDeclaration extends CeylonCompositeElement {

  @Nullable
  CeylonClassBody getClassBody();

  @Nullable
  CeylonExtendedType getExtendedType();

  @NotNull
  CeylonMemberNameDeclaration getMemberNameDeclaration();

  @Nullable
  CeylonSatisfiedTypes getSatisfiedTypes();

}
