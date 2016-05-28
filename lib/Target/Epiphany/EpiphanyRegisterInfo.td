//===-- EpiphanyRegisterInfo.td - Epiphany Register defs ---*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Epiphany register file
//===----------------------------------------------------------------------===//

class EpiphanyReg<bits<6> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "EP";
}

let Namespace = "EP" in {
def sub_even : SubRegIndex<32>;
def sub_odd  : SubRegIndex<32, 32>;
}

// Ri - 32-bit integer registers
class Ri<bits<16> Enc, string n> : EpiphanyReg<Enc, n>;

// Rdi - pairs of 32-bit integer registers
class Rdi<bits<16> Enc, string n, list<Register> subregs> : EpiphanyReg<Enc, n> {
  let SubRegs = subregs;
  let SubRegIndices = [sub_even, sub_odd];
  let CoveredBySubRegs = 1;
}
// Rf - 32-bit floating-point registers
class Rf<bits<16> Enc, string n> : EpiphanyReg<Enc, n>;

//===----------------------------------------------------------------------===//
// General Purpose Register File Description
//===----------------------------------------------------------------------===//

// General Purpose Word Integer Registers
foreach I = 0-63 in
  def W#I : Ri<I, "R"#I>;

// General Purpose Double Word Integer Registers
foreach I = 0-32 in
  def D#I : Rdi<!shl(I, 1), "R"#!shl(I, 1)>;

// General Purpose Word Floating Point Registers
foreach I = 0-63 in
  def F#I : Ri<I, "R"#I>;

//===----------------------------------------------------------------------===//
// Special Registers
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Register classes.
//===----------------------------------------------------------------------===//

