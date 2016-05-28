set(LLVM_TARGET_DEFINITIONS Epiphany.td)

tablegen(LLVM EpiphanyGenRegisterInfo.inc -gen-register-info)
#tablegen(LLVM EpiphanyGenInstrInfo.inc -gen-instr-info)
#tablegen(LLVM EpiphanyGenDisassemblerTables.inc -gen-disassembler)
#tablegen(LLVM EpiphanyGenMCCodeEmitter.inc -gen-emitter)
#tablegen(LLVM EpiphanyGenAsmWriter.inc -gen-asm-writer)
#tablegen(LLVM EpiphanyGenAsmMatcher.inc -gen-asm-matcher)
#tablegen(LLVM EpiphanyGenDAGISel.inc -gen-dag-isel)
#tablegen(LLVM EpiphanyGenSubtargetInfo.inc -gen-subtarget)
#tablegen(LLVM EpiphanyGenCallingConv.inc -gen-callingconv)
add_public_tablegen_target(EpiphanyCommonTableGen)

add_llvm_target(EpiphanyCodeGen
  #DelaySlotFiller.cpp
  #EpiphanyAsmPrinter.cpp
  #EpiphanyInstrInfo.cpp
  #EpiphanyISelDAGToDAG.cpp
  #EpiphanyISelLowering.cpp
  #EpiphanyFrameLowering.cpp
  #EpiphanyMachineFunctionInfo.cpp
  #EpiphanyRegisterInfo.cpp
  #EpiphanySubtarget.cpp
  #EpiphanyTargetMachine.cpp
  #EpiphanyMCInstLower.cpp
  #EpiphanyTargetObjectFile.cpp
  )

#add_subdirectory(TargetInfo)
#add_subdirectory(MCTargetDesc)
#add_subdirectory(InstPrinter)
