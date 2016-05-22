//===-- EpiphanyTargetMachine.h - Epiphany TargetMachine --------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the EpiphanyTargetMachine sublcass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef EPIPHANYTARGETMACHINE_H
#define EPIPHANYTARGETMACHINE_H

#include "llvm/Target/TargetMachine.h"

namespace llvm {

class EpiphanyTargetMachine : public LLVMTargetMachine {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  EpiphanySubtarget Subtarget;
public:
  EpiphanyTargetMachine (const Target &T, const Triple &TargetTriple, StringRef CPU, StringRef FS,
                         const TargetOptions &Options);
  
  ~EpiphanyTargetMachine (): override;
  
  const EpiphanySubtarget *getSubtargetImpl(const Function &) const override {
    return &Subtarget;
  }
}


} // end namespace llvm

#endif // EPIPHANYTARGETMACHINE_H
