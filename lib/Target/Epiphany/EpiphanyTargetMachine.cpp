//===-- EpiphanyTargetMachine.h - Epiphany TargetMachine ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

#include "EpiphanyTargetMachine.h"
#include "EpiphanyTargetObjectFile.h"
#include "Epiphany.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

extern "C" void LLVMInitializeEpiphanyTarget() {
  // Register the target.
  RegisterTargetMachine<EpiphanyTargetMachine, /*HasJIT=*/false> 
    X(TheEpiphanyTarget, "epiphany", "Epiphany");
}

